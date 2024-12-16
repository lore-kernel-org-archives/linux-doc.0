Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F26D1494C9
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734363205; cv=none; b=bvhqrhGLGQtvklSlHyX80Cb/FuKZ1TUGsJkhkVdG7ui5Qoym+w+hstxGmYy3djzchlC74iyOt8AViR8tOYUk81wKldj2kFPnn7vCevVhEWpWvucD6fk6b99MANXbSOkKtJzmybyQOf66SIq7kxPOb4ywwmvNMBbW7tcb36mFlk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734363205; c=relaxed/simple;
	bh=k2BVVa3MkS2pSp9VQ972U31cQaOuuNggDHTpqRY+xCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHP55nZR8V1d82cOAYGyUloHWnh4t6v0wA0nIxk1UI6H8wCGhPH4gieoucw1E8EpxeIIDV8AXTES5oUvZRWf1Ltj4kBWCdB3BOqJdwttgbkIMgV+6oPVaus691ZV+fI3Mo4diA0iHSYHNwj4CRAvclx5PbxocRdYBMadMSrQcVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WswdvB60; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WswdvB60"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467abce2ef9so467661cf.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 07:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734363203; x=1734968003; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k2BVVa3MkS2pSp9VQ972U31cQaOuuNggDHTpqRY+xCo=;
        b=WswdvB60V7SfmgZ/CTF1nJtkxZj0CT8lVGd8ihGTjMolU5crcJLHK3CbQ5F7d9NEdj
         Y8QN2nYt5ywdWwFHpm0hc97Y6SQT1NQaJBUoo3W61tQAgjr5GjNdirznA2er+GFyaQc8
         41lKBuesnfo1P2EtGnMlvKL+3KecDrrmhI8JLfPIsh/JhzFZbniF0ZsviQoC5VOBN+TL
         QmqbUQbEOt5n8NTCn3Mj8w98n8NL1dz28Gj8RSJgkc+dkwMGeDtvQouUCRqU6DvfIhfL
         /uoT+xo4oVG2N+kLDj+PTPeU0Rjq7OiYxmqTVX8p3HTzL+IKyOnBMZrt/qAxFDBTQ9Qm
         eL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363203; x=1734968003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2BVVa3MkS2pSp9VQ972U31cQaOuuNggDHTpqRY+xCo=;
        b=dXuHu3ehY5Bw/m5nRcKt4hllYZeKURkhcARQvHxJ28ycVDmeC6dhuHcfQ0VyCz2WaB
         tOSdcY9MRIgOZKRz0oK0+p9X5hpGQFtTCiCIDIGyhXAtza+sCoSF3O6CKFjkfdljznr8
         8SY5qSM6D0CQqqNlhZvZP9i1I9KRu+jEDBpH50OWTiuzW/jOM/g0BUpFXiAtTQk2EBgI
         OhNRLrKi8QBPMlddQFYS2ncwc4eLl868rMQIU1hvgmT6m84hi/r5q7it4gxUDu4jSGLf
         RxCYPuprrVtfpvN6vYD8Ok/hgMN7ia3onlzSaWTltnOSLfhdnjqtXmRoo0Y+tN9G3r6C
         BAsw==
X-Gm-Message-State: AOJu0YygNSNgXgtBoFd3SxpT6aGhx5xUJage9CQ+XAlpVG8LwakUxtV9
	SNsm701C/CbKXUAlNyhErBIWF5VIUOnGDDRxEu8k3ulsR+C2MFayEVueSQ0KqpN2j3fAqlX9IEy
	BEL9t1ykSxLcZVYL7BmZdFCOUGfSNkcRwELUt
X-Gm-Gg: ASbGncu8h+F/6fOoZRpKpoUHvzCyEZiH0tFJqHqvDQsxlNV3O+RJq2Cfu0ToUqsLWl4
	xzvwLZ+Q+TdpAtX8+igJAESdvT6GZ/rvYx2f/5kUHjOVe+0jiADsVEeK+62bUSfaWrIbZ
X-Google-Smtp-Source: AGHT+IHuJc79DxCN+abqtue+xBmsFhPBY/Pf55GM4/Ic8mGSlSRIT+aKgUEXyIwCiVSx+IsdC84Wt8kIy0Wg2WV/hxo=
X-Received: by 2002:a05:622a:181c:b0:467:5fea:d4c4 with SMTP id
 d75a77b69052e-467b4a6c5d2mr5868221cf.27.1734363202954; Mon, 16 Dec 2024
 07:33:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119-force-cpu-bug-v1-1-2aa31c6c1ccf@google.com>
In-Reply-To: <20241119-force-cpu-bug-v1-1-2aa31c6c1ccf@google.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 16 Dec 2024 16:33:11 +0100
X-Gm-Features: AbW1kvbmi-5mKEdhbI4oMFLF-3LRo2kJTmyaByTCrwqwp4BrLtaNHFzWH0k0yWo
Message-ID: <CA+i-1C35GBj2CaXs67va-SVpnu0ft8EoFTxEybjJnyOUy7RMow@mail.gmail.com>
Subject: Re: [PATCH] x86/bugs: Add force_cpu_bug= cmdline param
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all, any thoughts on this?
