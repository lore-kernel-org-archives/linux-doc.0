Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDE4BE48
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S04xkgS1"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA23C0;
	Fri, 27 Oct 2023 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698416657; x=1729952657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o9q69zntTngL5HlC4Hh3ir1Xj+G9xs29J6LfyeT2YVE=;
  b=S04xkgS1o0S/3D6Ui/IF7EaSrpjhB9bUFjZCoABnPgKphjTe1xxQcSif
   gjgjMj0wXdEJJCcBrcEzZNluEMuas1O3859OqYN0W7Duzf+ycXkwA0Ulo
   VUIzB6bsmQulM6Prorgsxvm4wP5jVLBmb3pkBIPmlXunwZGdh+7ogD3nF
   uGRbgX832vI60QU6FgPBzUWUgC2rNSkzf0N/euC+uUMwRYupuTxLnALZD
   qSIBD5KnqzONnrAgvnTCrtuZCh2X1dZVfbhwk69kXZC7dOt7ewPviMtoB
   9U+fLLrFFeMN1AO1l3DhpOAcsRr2TEafrooVLWpB60nThp954yuHic/2T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="6407079"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="6407079"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 07:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="788837975"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="788837975"
Received: from dmnassar-mobl.amr.corp.intel.com (HELO desk) ([10.212.203.39])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 07:24:08 -0700
Date: Fri, 27 Oct 2023 07:24:07 -0700
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
Message-ID: <20231027142407.5yb44shspokmis65@desk>
References: <20231025-delay-verw-v3-0-52663677ee35@linux.intel.com>
 <20231025-delay-verw-v3-1-52663677ee35@linux.intel.com>
 <8b6d857f-cbf6-4969-8285-f90254bdafc0@citrix.com>
 <20231025220735.gpopnng76klkbuu3@desk>
 <0ee3e3cd-01b2-4662-ba08-d137663f1699@citrix.com>
 <20231027134829.7ehdjwf5pfcqr6xp@desk>
 <cecd13f6-6d46-4a88-a30b-ce244d8fcd80@citrix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cecd13f6-6d46-4a88-a30b-ce244d8fcd80@citrix.com>

On Fri, Oct 27, 2023 at 03:12:45PM +0100, Andrew Cooper wrote:
> Almost as if it's a good idea to follow the advice of the Optimisation
> Guide on mixing code and data, which is "don't".

Thanks a lot Andrew and Peter for shepherding me this way.
