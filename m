Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2FE802
	for <linux-doc@vger.kernel.org>; Sat, 21 Oct 2023 02:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjEamM8E"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D66CD46;
	Fri, 20 Oct 2023 19:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697854904; x=1729390904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uTfWeCyQb/gkcYps2//6ulKi3cBIu9cNCAyCJLjIm9g=;
  b=MjEamM8EpBT8IQuKgx1mMr9c+zjRX4+6HKQzRHwXvDxDyNPKOvhXHs7x
   AR2uAeSHuoSJDiOBRvezI/qpX3xJtQqBjalyT06aM7+0okemDVBMBkffg
   wrdO5DqXj+oMme4pAVNUgpaEd4ow4gDr1anqYWdBRX9mhl4tqTISwXFgN
   qyXPFLFsqSoa9Mm8K9nsH0u0eYwTTmG+VzLJ4hMAULSKgseGv+EraQFQ/
   7+MPXDo7vKYbskGN8c8zv91ks7imscdw4YT6DJNfVDE5OSYrW5cf5GBNs
   dYSSjGHHbslJa2ByCp1IG9J5SWJvQFqr1oMAGu9E/hlx9tOyYnHZ6o+9m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="366831930"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="366831930"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 19:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="874099227"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="874099227"
Received: from hkchanda-mobl.amr.corp.intel.com (HELO desk) ([10.209.90.113])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 19:21:42 -0700
Date: Fri, 20 Oct 2023 19:21:34 -0700
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
Subject: Re: [RESEND][PATCH 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231021022134.kbey242xq7n754rg@desk>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-1-cff54096326d@linux.intel.com>
 <f620c7d4-6345-4ad0-8a45-c8089e3c34df@citrix.com>
 <20231021011859.c2rtc4vl7l2cl4q6@desk>
 <bdfefc38-c010-4423-b129-3f153078fd67@citrix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdfefc38-c010-4423-b129-3f153078fd67@citrix.com>

On Sat, Oct 21, 2023 at 02:33:47AM +0100, Andrew Cooper wrote:
> On 21/10/2023 2:18 am, Pawan Gupta wrote:
> > On Sat, Oct 21, 2023 at 12:55:45AM +0100, Andrew Cooper wrote:
> >> Also it avoids playing games with hiding data inside an instruction.
> >> It's a neat trick, but the neater trick is avoid it whenever possible.
> > Thanks for the pointers. I think verw in 32-bit mode won't be able to
> > address the operand outside of 4GB range.
> 
> And?  In a 32bit kernel, what lives outside of a 4G range?
> 
> > Maybe this is fine or could it
> > be a problem addressing from e.g. KVM module?
> 
> RIP-relative addressing is disp32.  Which is the same as it is for
> direct calls.
> 
> So if your module is far enough away for VERW to have issues, you've got
> far more basic problems to solve first.

Sorry, I raised the wrong problem. In 64-bit mode, verww only has 32-bit
of relative addressing, so memory operand has to be within 4GB of
callsite. That could be a constraint.
