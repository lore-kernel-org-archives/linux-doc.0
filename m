Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F9514AA9
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 18:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l94/Yqjx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CF3C433C8;
	Mon, 23 Oct 2023 18:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698087405;
	bh=RKQ1pbNtIiiIYv1ffY3rTP4iIBSITuSmtnVZMc7D0fA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l94/Yqjx0pS0ri8nG0RUzL16OruKvi8dMjYHWpDbZtbBjoRaONTmJH1o9kqKijb4G
	 RGVM0arXQFOZ8fQH8q0aSuTWtbq/HnAgEgjEEBHol0EnvaBTCG9x37m9Oq9HLWhGBa
	 kAe75jrQ/W4rMZyRJ6Bt//lkfj18Ou++/4cBHqeWE9DzYkjm+tISl63ya7seszPfyi
	 zlFz+hnann6vD2dM3v7vxtvf8BIB1SbGRGEnE/+i6tGNnIB/Il8Qdipu/O+vE8A29d
	 kqLJDb0oWum0AuGWjBnnEzV1OwWCV7jTNGNNqwhc7r4v+NVsmPsUQ/jHAByHIQ2GF3
	 pdUhuOiRVCkYw==
Date: Mon, 23 Oct 2023 11:56:43 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com
Subject: Re: [PATCH  6/6] KVM: VMX: Move VERW closer to VMentry for MDS
 mitigation
Message-ID: <20231023185643.oyd4irw43ztdqtps@treble>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-6-cff54096326d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231020-delay-verw-v1-6-cff54096326d@linux.intel.com>

On Fri, Oct 20, 2023 at 01:45:29PM -0700, Pawan Gupta wrote:
> @@ -31,6 +32,8 @@
>  #define VCPU_R15	__VCPU_REGS_R15 * WORD_SIZE
>  #endif
>  
> +#define GUEST_CLEAR_CPU_BUFFERS		USER_CLEAR_CPU_BUFFERS

I don't think the extra macro buys anything here.

-- 
Josh
