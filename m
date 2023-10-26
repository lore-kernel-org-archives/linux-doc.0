Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F33D99D
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 22:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+gJlMSK"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA56CC;
	Thu, 26 Oct 2023 15:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698358428; x=1729894428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Yv1JvOjvS0kO4GNtpkTbKPp6UyvAbJPJrBhkuPrjpvY=;
  b=P+gJlMSKpFnNpByPvMnyORaxfZscw5aLclEP+jTcqGezqGAiMObtpXIr
   5F12MYPsiK69TKWtFmyohg0BdwOBbjFnvculprCdnGNtWGzWUh3z+aHVx
   MEO1rL/zDg5pDFkwSvwJYvJGifO+1x83N2or6qrRZJMsZRxds83+oTQeJ
   hwq4SWVmsqxJRTH0Wx96LStDt7czL/tz6V1GPazQlig/BMwW56U1CYYSy
   v7tBJ3p4YOKCZVjhF3UAWxI3XTkM/7I5J61JJLMihA89hnsIwguKKLhl7
   6BegVyvuruzMRaJk6Pg7myPh0KQGuzJLFZgfEBzkSIAHkh98EZuqAjMQE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="372710660"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="372710660"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 15:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="876120212"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="876120212"
Received: from paseron-mobl4.amr.corp.intel.com (HELO desk) ([10.209.17.113])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 15:13:13 -0700
Date: Thu, 26 Oct 2023 15:13:11 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Nikolay Borisov <nik.borisov@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
	antonio.gomez.iglesias@linux.intel.com
Subject: Re: [PATCH v3 2/6] x86/entry_64: Add VERW just before userspace
 transition
Message-ID: <20231026221311.5dqmnmvq4pnpqswn@desk>
References: <20231025-delay-verw-v3-0-52663677ee35@linux.intel.com>
 <20231025-delay-verw-v3-2-52663677ee35@linux.intel.com>
 <2cda7e85-aa75-4257-864d-0092b3339e0e@suse.com>
 <20231026192950.ylzc66f3f5naqvjv@desk>
 <ae3d993f-6ce4-42de-b9c4-ef0c7db663c0@intel.com>
 <20231026211508.tmd7hfniesiu53ps@desk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231026211508.tmd7hfniesiu53ps@desk>

On Thu, Oct 26, 2023 at 02:15:11PM -0700, Pawan Gupta wrote:
> On Thu, Oct 26, 2023 at 12:40:49PM -0700, Dave Hansen wrote:
> > On 10/26/23 12:29, Pawan Gupta wrote:
> > > On Thu, Oct 26, 2023 at 07:25:27PM +0300, Nikolay Borisov wrote:
> > >> On 25.10.23 г. 23:52 ч., Pawan Gupta wrote:
> > >>> @@ -1520,6 +1530,7 @@ SYM_CODE_START(ignore_sysret)
> > >>>   	UNWIND_HINT_END_OF_STACK
> > >>>   	ENDBR
> > >>>   	mov	$-ENOSYS, %eax
> > >>> +	CLEAR_CPU_BUFFERS
> > >> nit: Just out of curiosity is it really needed in this case or it's doesn
> > >> for the sake of uniformity so that all ring3 transitions are indeed
> > >> covered??
> > > Interrupts returning to kernel don't clear the CPU buffers. I believe
> > > interrupts will be enabled here, and getting an interrupt here could
> > > leak the data that interrupt touched.
> > 
> > Specifically NMIs, right?
> 
> Yes, and VERW can omitted for the same reason as NMI returning to
> kernel.

Thinking more on this, we should not omit verw here, as this spot is way
easier to target NMIs. A user executing SYSENTER in a loop has much
higher chances of causing an NMI to return to kernel, and skip verw.
