Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5C2E65C
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 22:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3zm3Pv4"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43031181;
	Wed, 25 Oct 2023 15:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698271659; x=1729807659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rVH8e2xYJkm/6qBrfAwjjJPiaUgou/S0L0j6IGkYVcs=;
  b=R3zm3Pv4id/aMZxuhD9+KIF3eckEHWLnjv4PeMy+VzLD5im1nXRQ/BFm
   LRTm/Jxg6t6b0l++sbaB3p52YPtxqWRreagKPVi3EQd2+ocoJUnakKYVu
   JHGh5JIRTRRUKNILeQsBsVHke4hftmaJbzw37dlnonCI+V9/OUgTeIX/P
   ztNPDFdi2rkqtfDeyxnKUy8JpI/ae8H9L4eS2Y3qv8zn8q2x8eRNUURxF
   iJhGJXNC/1kFCRIjOnE9GpGs/7eSIswVttthpv7xoYPRsrQEWXvOLO5mz
   q0E1xnWPRVrSELks8VuF/pBGF+Lza4vKB65Xni2bHtpjyPwdsywvCggVb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="391280180"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="391280180"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 15:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932518794"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="932518794"
Received: from kkomeyli-mobl.amr.corp.intel.com (HELO desk) ([10.251.29.139])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 15:07:38 -0700
Date: Wed, 25 Oct 2023 15:07:35 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Alyssa Milburn <alyssa.milburn@intel.com>
Subject: Re: [PATCH v3 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231025220735.gpopnng76klkbuu3@desk>
References: <20231025-delay-verw-v3-0-52663677ee35@linux.intel.com>
 <20231025-delay-verw-v3-1-52663677ee35@linux.intel.com>
 <8b6d857f-cbf6-4969-8285-f90254bdafc0@citrix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b6d857f-cbf6-4969-8285-f90254bdafc0@citrix.com>

On Wed, Oct 25, 2023 at 10:10:41PM +0100, Andrew Cooper wrote:
> > +.align L1_CACHE_BYTES, 0xcc
> > +SYM_CODE_START_NOALIGN(mds_verw_sel)
> > +	UNWIND_HINT_UNDEFINED
> > +	ANNOTATE_NOENDBR
> > +	.word __KERNEL_DS
> 
> You need another .align here.  Otherwise subsequent code will still
> start in this cacheline and defeat the purpose of trying to keep it
> separate.

Right.

> > +SYM_CODE_END(mds_verw_sel);
> 
> Thinking about it, should this really be CODE and not a data entry?

Would that require adding a data equivalent of .entry.text and update
KPTI to keep it mapped? Or is there an easier option?

> P.S. Please CC on the full series.  Far less effort than fishing the
> rest off lore.

I didn't realize get_maintainer.pl isn't doing that already. Proposing
below update to MAINTAINERS:

---
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Date: Wed, 25 Oct 2023 14:50:41 -0700
Subject: [PATCH] MAINTAINERS: Update entry for X86 HARDWARE VULNERABILITIES

Add Andrew Cooper to maintainers of hardware vulnerabilities
mitigations.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2894f0777537..bf8c8707b8f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23382,6 +23382,7 @@ M:	Thomas Gleixner <tglx@linutronix.de>
 M:	Borislav Petkov <bp@alien8.de>
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
+M:	Andrew Cooper <andrew.cooper3@citrix.com>
 R:	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
 S:	Maintained
 F:	Documentation/admin-guide/hw-vuln/
-- 
2.34.1

