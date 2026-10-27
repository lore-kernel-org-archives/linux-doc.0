Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110528;
	b=j7rqlIyhoQOuBNl/V8X3s7BXpU1wBV8RTBFnC5PgTb/eF8oKrhQd/LlCJJe1ArBN6w23
	 v4q70mprZ5QvihgUwvaHGIgqu9A7yzhEEijaQsqHrYbt0fGZF7BrrnvrxDLh3Wded52M2
	 CSnSSa9SFZEpEz2V828vaWgekNF63hB4fSK4BTnCfg0xLSGim63wHvYudt62gN2rkMGkS
	 dpHyYxGs7kcZKDrx3oDXpswchGegnacNQd8lfENl4hN6v44ub1nUq9Rggpzint5HYxu7W
	 HF9yy+eZni0ZV6PZ1mFlUOvS8iF40+n01OjLGuiy89mYRrXH0r1dHG+XaSkrM9dKBtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zUsMbjO3gCQtUvLruyRuDb07/mulBS+KPR/B4sl8JQg=;
	b=wfIriLpmLEzOOisgyEOdvqYUUuCa5yPliQZHI/0NC3e4bUpWErQoC1M3wtSy0NpwTxuk
	 7TQ+C1zPjH16CcuElf6gjHC8qBuf3LW2DQODu6Nt4z4CMIuLa+Kqmvb7gAEBfJNya7yqv
	 VVl6l8O5vG2/7/CrdzdRv5RzxIyMu4EyzdD1gRCC5R0wJKOjZRLNyl8a8ahgLZmBqYmVF
	 3l/MXqXXSM7R88mB4f02aj+Fn+S8OuaHA+jTq9sguqZCjyIH8u/3u2HeBa0uJd9eochDo
	 qWvipUuLxFOkCurRngkAq0sQu0porLbG1d52nT79YfGhmbcyU3Eb+ph59aM4v0awl5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Be4xWtvF;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC3D606A31E
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 14:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC3D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Be4xWtvF
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f3c89594cso280686885a.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793110526; x=1793715326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zUsMbjO3gCQtUvLruyRuDb07/mulBS+KPR/B4sl8JQg=;
        b=Be4xWtvF6zD3vHFfarAJm9xvRSujoQ4ZcjWYGMVUL72IZdQIrglRXya7nu1BUbTDL4
         JU5H5uRGbpfBgIl70sNPb7M5LjoH0JVWDiWYrd5p4dA1OYCaMa+eIU/FSQPzPq322pXW
         3BIOxxgck38BNY71yNhw4SSAeSgx6JinXx3Zn9yaso3wr//ChfahhDpgNLVyEjzAUE4O
         dAZ29PJibsBSyXgYh9LfzzRTLPKUcXDHhi6ZnUGansAH2HGrRy8Pnu4yfMUh815lcwdA
         ly/eGdf5n5xPlK639WdhZJDZBQmI4py6CAaKCrpKXNlKtynHB1yPt8pqrUeP1VSUuNAQ
         Z3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110526; x=1793715326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUsMbjO3gCQtUvLruyRuDb07/mulBS+KPR/B4sl8JQg=;
        b=EZRreV6bItJ2nN1k2KByMx0idYs6NueTIvvvDRec+s2FSjJPuXIRrJBG3IGQPlCYSf
         +RttUKagiAWlhu6BcUeRn1t06/gfJs0zWdTa8UXURjGqEXB1DznzIULbSJtSlZo8c+b2
         XaiHhyb5oq7b7mNWbIr40IEBfEZq+3MDKxuBCbEZ6bPVAs13JLjuBqTitvEU84D7s41H
         VnQwcIqICKzGHK4iSiX3DlcTEkPG1cMrHG9U7BQ1XUBJpag7ORQKttptmYQvu3y1hXUp
         jky/7Wd4JLnY2nGQjk438Vm9YVVsXTUZZ04HrcBShIegIOUumht3a/wr2hXQ/pW0WS99
         iVOg==
X-Forwarded-Encrypted: i=1; AKwUvBwVjYeuOUTTdOa5MKbWkHSkey+UYtwPVgbhc15yKyfew2BviKr1anHbjRqPsKglcMGlg9yHudv3WLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbyylO50pry6EwnixEDvMsvzTuPOxryOHEZTz8Dr3E7rDsnDpB
	nr6IBsQcgrjsbXUdKrtSHz6U7yIrhxbH9UtW4SJ4TU1h8Ow8W2AieoJylJ2Rlur4FQE=
X-Gm-Gg: AYBFou3jzjBdz4oSQd6WjhWXpbdMm8R5mY6ATkLvcIkt7WDg+Kw2P3253zx/+FhRt8t
	YN60qXBhWt4IZkR3VTMlzrz+tLI0///gvIr03MUpfR9IrEbEuYmvQ53IAcYUwXeabM26BhJde3e
	ppgLFlUEOQj1nYDdjJFPApyzFiMec5JRGgPaXr5JF7Ankk6T5AKMGu9SS4liHpn42g2eclNXyYu
	scD9K5fLweLBpSz+uOpgMuqQVTjXh0E8EIOVY9XVws1EID3GgFYfSKGO1Sw2glfRsEMpji8BxU4
	qKL12dR66uJI+JwccWFwFmfAq2kj14eQjd+eMo/coV6tUKS+XAlTuIgPQTzEKp/nUia1rSijwGa
	zienjA4j5iJpH04qcPmj6SJKDrf9/kG2a6xcRvE+8Mylhh+b46HElLUTtVebnOnAsbT672uxd6G
	FaqQ3RiIRY5fbJDetCnzbdjHGlvBUAAXzpeQFZENiI3d9RhWiwiHLRGgJMdLNgU1Ica6M8xqzJ+
	55SdD68rvtEEfaqZ7hHi/dG+TpZ1qVPt+/6rEfb3Pn+nrshgBw4PyqqVrSrJYj6a0cHe9hDzjCd
	Tldjlc21qTIQOCW7MNs05yXqSjj7xEcNunGnqA==
X-Received: by 2002:a05:620a:261e:b0:93f:d27:c89e with SMTP id af79cd13be357-940ef9d6997mr1602321285a.75.1793110526435;
        Tue, 27 Oct 2026 07:15:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0787d96sm982932985a.28.2026.10.27.07.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:15:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLhxU-00000009zYJ-422J;
	Tue, 27 Oct 2026 11:15:24 -0300
Date: Tue, 27 Oct 2026 11:15:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 02/20] ctlv: Add the UAPI wire format and family API
Message-ID: <20261027141524.GF1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-3-jiri@resnulli.us>
 <at-iEMxN98nie1Qr@e129823.arm.com>
 <auBaROC0XdWpILEI@FV6GYCPJ69>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auBaROC0XdWpILEI@FV6GYCPJ69>

On Tue, Oct 27, 2026 at 09:02:14AM +0100, Jiri Pirko wrote:
> Mon, Oct 26, 2026 at 07:55:12PM +0100, yeoreum.yun@arm.com wrote:
> >[    3.856919]  ctlv_schema_check_attr+0x3dc/0x538
> >[    3.857105]  ctlv_schema_check_indexed_nest+0x788/0x958
> >[    3.857301]  ctlv_schema_validate+0x88/0x180
> >[    3.857482]  ctlv_msg_test_as_deep_as_the_core_allows+0x11c/0x1e8
> >[    3.857698]  kunit_try_run_case+0x64/0x188
> >[    3.857878]  kunit_generic_run_threadfn_adapter+0x30/0x68
> >[    3.858086]  kthread+0x10c/0x140
> >[    3.858245]  ret_from_fork+0x10/0x20
> >[    3.858398] SMP: stopping secondary CPUs
> >[    3.858630] Kernel Offset: disabled
> >[    3.858720] CPU features: 0x0,00000000,00b0802e,9f190bc3,2affe72f
> >[    3.858872] Memory Limit: none
> >[    3.858976] ---[ end Kernel panic - not syncing: kernel stack overflow ]---
> >
> >[...]
> >
> >I think it might be good to configurable according to architecture
> >unless it's not good to reduce the CTLV_MAX_NEST_DEPTH number
> >otherwise, increasing stack size when CTLV is enabled seems unresonable...
> 
> Agreed, will lower it down. I think we should be okay with 8 for start.

I'm surprised this ran out of stack though with even as few as
32 levels.. Is there accidently something large on the stack?

Jason
