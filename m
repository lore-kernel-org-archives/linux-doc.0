Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795363958;
	b=5iWmvgB+JOuMd0YkbXAFtEYUwmT7G9BFGIgxbCtdBvfSZolaRfKA8/Jmy1KA0b91N1v9
	 iLgyouaBhO+q5jMzShpKs3wOEHstu5l2o71Cmz1QTp2JfTk2ERIVlG1mBODwpMpHcMEP0
	 M0TWrJhu9hLwTATGVS1tT5mKCPe5PdwyM3iQf5isYEOJJ1++FV2sKnvMiJjD5+njBIYDR
	 cHWpf6vv8MDa2GEALC/N65KmmqtjU3PfXYIQIXPoix+81Y/E6279kUd8FzN8R8EJeWiAg
	 Vnv3GSqD3MItPcTawxXmZ6/Xr7ymRk+4/wptV2J5JLJBUPcLKZfgSx7x1LsNDq98+Vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=gN0v4tkkhJ4RGbnhJzIyNpPVIRvwpUIPobFljeCucIg=;
	b=EErFG43tHCPnlix5gEXNzmM2dicSYALh8wr8Z64gce6AhJMIyNCmsGUKlYax6m4dq7Bv
	 vPHlSxCHmECPJLYFxjNRrtimifo8VDkydzyQyYWZnFxYaYYChhsJSWOnOA0Zv7d9GR86P
	 eF8HQM+t/EkVFrSFTG/ODJQhHmVKU1CWYmsC7A9Bfy54OygTXSah9yxLm2xP6DIpgLSaa
	 EnoO+YlY7tIVRXUM5GSi6WwsGy+A/Oo8D2Yc9N4S5I+bQoNLmtYdRr0bgjmUrq5c+BwXf
	 EPt5pvbbausM61iwd9cAtWajBNrsDNH0vinNByY863+y6Kh8IE46uIQ2kC2EwTxGilA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H04lU7r6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298D4606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298D4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H04lU7r6
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55d30c054dfso29364081cf.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:12:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795363957; cv=none;
        d=google.com; s=arc-20260327;
        b=cZILvUdGS8oM6K+onhHSlMdjpWrx3zl2ojYQkMf+vcap6pk1WUt0yAlAYZKOmftwaA
         MphnLCq/ipKVyCzPCC1wKgam9+u5dASSqnjr/wLKi1YUlE7ZtMFyz3ApyztD1JSZk4SG
         01/nsNhhahA1N/0CO0UNvgTVxr/IXLNEGPuUsywFNMPRVrA0toZyNH9AO71wMGpey3pb
         CQDDLsY5h9NYn/q2EyjaZen1nPTGGHP2wNIuzvXH1BAOlNimgf+raqa/qOgjP+VY1imT
         atPCYJZOrAWjE7i3+oHUePHL+4zyuvuAQ8NY2zvEDnUqbiyA5Pg1vmcnzDWGw6bY2Qnd
         WuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gN0v4tkkhJ4RGbnhJzIyNpPVIRvwpUIPobFljeCucIg=;
        fh=rHF9HrRsAaTmHGFU3eReCZKsvrY8WBcpWYcatFpJ1aE=;
        b=eijU/2bJmOAyDB1/EAPbyE6COhGz+azzDOPZV3XlSCaVxOCz/v3m3EPLVa58NFZzUF
         mGVHpXtgKIC+yUyticb0CRI2k15ZNnlMgbNyvVqE+9Bh+BrmPB75KHXEgtq6O267CbSI
         1BdtF1ToRlrbc/hEJdrnG5E3VbpTOdeGRYbmI604OONWN8yHj6H5g9NAL6rIHR96Yu3/
         LVP7NK2jk4TY49vs2/XWCo0CVMKKiWvUEXEe1Nyr1as6Zg/I8E7BmDdbwn4SLEXNjyor
         7AsLvoy3amGGYJt9qohpxnODd1ugk5fMFjAIAN596s3x7rdTCfA6ltOKmoop8Fe21Qfm
         CUnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795363957; x=1795968757; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gN0v4tkkhJ4RGbnhJzIyNpPVIRvwpUIPobFljeCucIg=;
        b=H04lU7r6Sj//xqtTYCXJG37ooC1eYsMQeAHyxQcMFtF4AZHodjGtvV9078Bktd4OHn
         Ow9N/Jjg+XBieLM6ybjw1LXpUhe3K0cQJPM4Kqw7tBgEpKP1tzdXszJqmz0Sb2hsT+MY
         yPLS9cXuKnu+7mwtWl3PxS6fKTHgOpRmpUQDnEr4QKVJfMh9HUYVqAPT9G6Svic364Pn
         v+73RFwtdj5jZdNUcqwYbtGS7QRResKRbNald6mHu4YNWxQzzsgF52vihuBcfl0IT4Ml
         pyWJom45k4UMIf/7C95JO/ONXJQILmajWMrtEHk+y98+ZwumlbyE9razYa6MW1ENAX2b
         iKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795363957; x=1795968757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gN0v4tkkhJ4RGbnhJzIyNpPVIRvwpUIPobFljeCucIg=;
        b=DFhMFHKc4EzHqz10OG63qc+W8Djp+ZGZyo7/Nq6DQ3fxUUocAqWPZX/c1sLcbb7hzD
         sgfGp7fVCUUnB+dS+hQiQ1ttf+uIdvoQMotsgLSyab2AevS1bwUotT3m7MIoChfnF5e8
         7GpqrhC8RYeswJequ4qLTYUv+/Zb8PmB+QHNE+L0SZSl88AEtoWiGRE5bNaO5M3HxmTJ
         Fb1mIoJRTHsCb2rcOmNg9bBH/rAHqJTpfmvUtx8CIZsAva+I9m6GIMgtfo3QewjPFRWQ
         aNOaPhRVxWbsY34ay0PEYLatN3r6mnymtSg0vPVfZt+WTCXxRfnO6AGoe6dJEXAqsms0
         p+ng==
X-Gm-Message-State: APuU4Z++cuq79OWMp/U4WKua8k+SWNx4g62nXoGkUv04W54VgO7zfgRB
	bXAP3freg/XAtKpElGdmDaFein0ZeNUlUCRxqWN/0zHOcIo/J5ZurJDwjUhYakdNMO7uIAerCu7
	TeuNhxTso4m+BtzLWr6g4W68GYD34SRM=
X-Gm-Gg: AZFdTZf4yCv1hQMfHKZd7A3tQA4MyRUcQRjPquGijypMUWp/KQAySRWGBP2PqNYG7Gz
	MJAeuPhMBn8noNSkzHG5rZPegRYbonE4xvoN6DnMmH/mKxYMmmUe4WeLxTuWaDqO+/ym3fqDH/l
	E2kHJyZt4SS6ePDTXk/4aRuyyUYfPRj7tbGPYi8FslSqDNK0Med4OR9On8RCbu3XqVkA/DIFBjq
	rVBHDpSaPCgte+FPEVDiO0YSyWRZQYdp5vRWH1Tt0fQTFJT5m/55ImIJfiaX58770C88wse2qxp
	uR4keCZUkaUc/1+cAWYjzHloRzdwC6Ayomv7PCGhkAMrlL/7r2PZCLxR6YnCuGD3f8uVuvYCCR5
	lCaN3odhbBe3tmiwcMXUUmklz0DAIcPUHpQqp32/Je6Nfn9TAyrf3CJvrCZv8biDDtP/lBMxMTz
	4uMOFzKzLsB1H4lIl8UXGOwshw6+t55QVhQiv+Mlv/FOziS7t+KVOqKyA3GIkJkra3BEkwlDT8a
	YN4BlrwbcAYkmWrXDRr0tRyxA==
X-Received: by 2002:ac8:5f0c:0:b0:55c:f47a:8c96 with SMTP id
 d75a77b69052e-55d768a398amr182332081cf.3.1795363957058; Sun, 22 Nov 2026
 08:12:37 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-handling-regressions-v4-0-b6b9f2070290@gmail.com> <20261122-handling-regressions-v4-1-b6b9f2070290@gmail.com>
In-Reply-To: <20261122-handling-regressions-v4-1-b6b9f2070290@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 22 Nov 2026 13:12:25 -0300
X-Gm-Features: Aa3M54pMBcIHCJlrDTKrA8DelkV4w9yL2lOLbdpcWJFfSWKf2YNriIPCuDoLHBk
Message-ID: <CAMAsx6dVo+8RL692xaVDnaqjMKr2JggSCjgYJPkKXmz2gby2Zw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] docs/translations/pt_BR: process: add
 handling-regressions.rst (1/3)
To: dreduardocruz@gmail.com
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2026 at 11:01 AM Eduardo Pereira Cruz
<dreduardocruz@gmail.com> wrote:
>
> Start the Brazilian Portuguese translation of
> Documentation/process/handling-regressions.rst, covering the summary of
> the essential points and the basic guidance on handling regression
> reports and on fixing them.
>
> The file is added in three parts to keep the review tractable.
>
> Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>

Hi Eduardo,

Thanks for your interest in the pt_BR translations. However, the many
patches and versions you sent in a short time, some for documents that
other contributors are already translating (stable-kernel-rules.rst,
for example), confused me a lot, and several have label errors.

Because of this, none of these patches will be applied until there is
some organization.

For future contributions, please read Documentation/doc-guide/ and the
existing pt_BR translations first, check the list archive before
starting a document, and send one document at a time, after running
"make htmldocs".

Thanks,
Daniel
