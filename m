Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91706156E6
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcTOp6Ug"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026CBD7;
	Fri, 27 Oct 2023 07:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698417535; x=1729953535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fKL8O9LfX0J38E00Mtc5QFOreN8mewIuIipoFxbNi84=;
  b=lcTOp6UgzEM6Kf2icDAPp8eLvbjv1T8ASaIqPXW6M0HZtEJe5sTiymwh
   Qc7R0PTSEpTTW1n1WwIjny1mDKps4glpB6KjAjrufN+8Vbg/Q0WS/GhMZ
   +NSoV0ytTMZKmO8YIBFopGxPVIY4rNSRO4/HS2w3EU/29VL0c9sBdBcyx
   jGws/LS+7kTD8jyv9i0aXlt74O+HoaBJkusX+9gszJHs3/Sood0q95rWm
   JwXUglzIKudXx7c9ZdsPJ+lDCUQ3SVYUxWoWlSE35p/4K12ikrZivkrXu
   xCDEG53jCelfRqXzBD8ITmu88ygrYczzU2v1hVkHiyN984iERbBEV51JM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="606700"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="606700"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 07:38:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="736094436"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="736094436"
Received: from dmnassar-mobl.amr.corp.intel.com (HELO desk) ([10.212.203.39])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 07:38:53 -0700
Date: Fri, 27 Oct 2023 07:38:53 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Nikolay Borisov <nik.borisov@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: [PATCH  v4 3/6] x86/entry_32: Add VERW just before userspace
 transition
Message-ID: <20231027-delay-verw-v4-3-9a3622d4bcf7@linux.intel.com>
X-Mailer: b4 0.12.3
References: <20231027-delay-verw-v4-0-9a3622d4bcf7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027-delay-verw-v4-0-9a3622d4bcf7@linux.intel.com>

As done for entry_64, add support for executing VERW late in exit to
user path for 32-bit mode.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/entry/entry_32.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index 6e6af42e044a..74a4358c7f45 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -885,6 +885,7 @@ SYM_FUNC_START(entry_SYSENTER_32)
 	BUG_IF_WRONG_CR3 no_user_check=1
 	popfl
 	popl	%eax
+	CLEAR_CPU_BUFFERS
 
 	/*
 	 * Return back to the vDSO, which will pop ecx and edx.
@@ -954,6 +955,7 @@ restore_all_switch_stack:
 
 	/* Restore user state */
 	RESTORE_REGS pop=4			# skip orig_eax/error_code
+	CLEAR_CPU_BUFFERS
 .Lirq_return:
 	/*
 	 * ARCH_HAS_MEMBARRIER_SYNC_CORE rely on IRET core serialization
@@ -1146,6 +1148,7 @@ SYM_CODE_START(asm_exc_nmi)
 
 	/* Not on SYSENTER stack. */
 	call	exc_nmi
+	CLEAR_CPU_BUFFERS
 	jmp	.Lnmi_return
 
 .Lnmi_from_sysenter_stack:

-- 
2.34.1


