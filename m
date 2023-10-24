Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925D914AAA
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 17:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVgPHnEJ"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8FB118;
	Tue, 24 Oct 2023 10:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698166903; x=1729702903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LXnWexfx+l2fWdcIpfiTsPsgHiGkpiAH7nVIiEx8dso=;
  b=HVgPHnEJid789G9Glnw3c9Gh28DWCMkMjjvbXf5Km6VClhIZAL3esoTH
   s1z4bsZg2Fj1mWzOJbm7APtRII8a0KodG+rvd/XXF5Tc3PttmzV2LqZWk
   2SGtyiZh+BOYxv/cdRGnnqiZkm2J5YpDJRRQIEpU/8zc03h8I1pkQcMLM
   w28iKQl+nG9B985bOd8ykUENp+gKe0cdrgZG/+x1IscC5ahY/VyXKYNbK
   Q6bl0bVfnRkqMVHSsClkc/I0or04ISUbklJQKnwmpsGm0FGcRzk7bYD80
   WRkQKyvt+DCzhD7Q2pktxQqCs5hEi3A6J5eyBecdIoutiLVgBaOe7T4mn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="5738490"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="5738490"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 10:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="758541222"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="758541222"
Received: from zijianw1-mobl.amr.corp.intel.com (HELO desk) ([10.209.109.187])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 10:01:41 -0700
Date: Tue, 24 Oct 2023 10:01:33 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>
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
	Alyssa Milburn <alyssa.milburn@intel.com>,
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v2 0/6] Delay VERW
Message-ID: <20231024170133.u45c5u2rq467lo55@desk>
References: <20231024-delay-verw-v2-0-f1881340c807@linux.intel.com>
 <ZTe32IOvhBNkIlKa@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTe32IOvhBNkIlKa@casper.infradead.org>

On Tue, Oct 24, 2023 at 01:26:00PM +0100, Matthew Wilcox wrote:
> On Tue, Oct 24, 2023 at 01:08:14AM -0700, Pawan Gupta wrote:
> > Legacy instruction VERW was overloaded by some processors to clear
> 
> Can you raise a bug against the SDM?  The VERR/VERW instruction is
> out-of-order alphabetically; my copy of Volume 2 from June 2023 has it
> placed between VEXPANDPS and VEXTRACTF128.

:)

Thanks for reporting, I have notified the relevant people. Hopefully,
this should be fixed in the next SDM release.
