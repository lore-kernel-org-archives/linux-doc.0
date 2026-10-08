Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747293B2FCC
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 17:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481217; cv=pass; b=FsB81BRwrzEcg1ocW4IODbX9y0IZF7P4n+ukESdNwTP/NNTmQ0oQVAExjhbripBTb2FbUHwdXLd/3iXkIoxWNIC6fYo32b9oZ/Oqoj0bViF7SjH+3VIqrBu/CgsYSwWmM7uLzCqDzdnfZUcz00jMNSXjTVh39WpG3T2n8IiKCbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481217; c=relaxed/simple;
	bh=XsMGwnJeuIE4BfymYHt2Sa8OULDQXiO0Y08zPXKAnKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tP2Y2WWtY5OZvrWF89ZgB/5BwWDsXgA2ltxNvMGWeKoDIkgt12WWOmWy8Tv4J0w9p8p1lYw0XpvdEIjIEQaf14mv57MBXxAXn2b52K3vTkQeat5XsW6jXVtd327aB08UCTFaTqKbYoakKWDV+cO4x1Pzc+Ix/9IAIX6WQUNmC7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NI+HIhnz; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NI+HIhnz"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcb7c57d27so106473e87.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 10:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791481214; cv=none;
        d=google.com; s=arc-20260327;
        b=GFTsbCXLU1MRuYyaTwrmU+wSfpgm9Pz3S1azws6k1NtZVqJ5EBLxQBvpa4Wd/BeSSV
         UXGMxgPF5gJ0spsUcqL4356kf7wkCBb9bVeC2/xvjVBk275YrjC4Ckrx1nhppfbc7XXn
         yz8fwmoc9FiOgF02Ltll4ncoHkO0smd9m7HB1xGgQnVVJt80OYDeEaiVQKzDweT1a1ax
         99nQZOu8XVdxAGfaXME6q8SeQvpHNUBwmbFTegHX0u49J5hJdlsQf4T9MwHOsajXVEM8
         YTSZUks8iuOfNCSs0ELmmLR/mWu33M/C1wYQBzHW3VtvLTV5LUN9955kWUnwan5/bx5b
         SlYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XsMGwnJeuIE4BfymYHt2Sa8OULDQXiO0Y08zPXKAnKo=;
        fh=DWGw7bxBadMCAKytW8sne+iYqA8AjCqxSbXa43iBBVk=;
        b=i0eM8Op9ziY8Hl8dLDBfT7l7FQ89fvG0sbxVO3vfS9hxa2GDPf4WfrR1AhFw+wpO8F
         GwjsvpKrJ0Np1rCZkhJFRxEF20rLSXkTEpejerTv/8AWi3VytM8TIASczVj/eruy4dI+
         TEBbMjI3T4lX4Ilyb+/y+aX6PaM99MehUX3yCGtv/2dD33L3KRJOzc1Wses84tYq4tIg
         eRTSwLo81sFhEJaQlOo58UEdxIvHbxjReh6zFWfuCDHoy+KRD74/qYzrZ5OwF5I8DKCQ
         g8awkdvDScZpnY4ZObo1CC1YbOOqYq5Tbo+mFb1hXjUaw1du8JP5O5MJSRsuwyarcPfa
         c8qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791481214; x=1792086014; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsMGwnJeuIE4BfymYHt2Sa8OULDQXiO0Y08zPXKAnKo=;
        b=NI+HIhnzgq29EcKNdRN26tOvMAyXP+9f3wvQmqx1OCOo5/pAeVYyBC5N1AXLtFSQeP
         afPGm7WK1y1tt0IUZTSxC6+kIfLpaeteyXwEYOwTfPDHkV4To1PXM8E1oT9YUo0K5FF0
         MvEg8JqKKTdrVW34HSUZDtDo7I3KYuDPJKUTW4/Vka+lpsCp1PTX5r66DFzlJ45SgS7o
         ji87GeyM4fE4IJGCrUIRfprqUC5oPhRhNu4Ud1WaAxiJwxeCaGjfAMrmBBB41g+XZX26
         BCmBGeJYwSxuY/fNfyyK3/DfjPniQ7xqpoENEqdMXQSVJp42kZ12kfSmCjy7X21NuWzi
         ZYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791481214; x=1792086014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XsMGwnJeuIE4BfymYHt2Sa8OULDQXiO0Y08zPXKAnKo=;
        b=syjas0LUIwaj+o4opZscsKwLNmU8TRPnA23HS9U/Ja0xvb8HZQtO+YinxUo4JojD7b
         DR+ZkEI1INA/FfFHgS9PTndhIg4ZF3GiPs74XEUeLmdlN7xD3Owdr+rTxFRtJLqjgi9f
         OKUOCD0HlEYP4ZWNQMXWdfmiHASdw82z9WjQTEjnGwl4brse6I5KLljCoOT7t1vt28Zt
         jxAfbz2zzZ3fMPa/SV0Nr87+c918h9btLsUcdgvNg5NHJF8H3YDymdFrTwZEAS+EG4VE
         ear01+0wj70zI3GCe9QJYVAJDdwEp3p/Cn1xcAi+lD+T5UGVQguQW291Jt+TluSo9wa/
         AOmQ==
X-Forwarded-Encrypted: i=1; AKwUvByhkQDtBAqVITeLkeqF1p3aE0zF89n+0x3PDcRp5DeXDr1boPHM7oflAMxCqWaOW9dduZaQ0Zn/qhQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIul2YyCpbncVNLmhgRDnQsGEcjPJEtLGfKHolHpucjOMiU1xYn
	GH1k4L9iH6Z+0mPag1RTB0SkqYtJZN9l39qv+15qIFN3y1uao+IjQRZc9A71Wl4RVyH2tVYreFB
	rvuN6Qvelioc8xSv2GXZOL/lEATLIdSA=
X-Gm-Gg: AYBFou0X1hKPaG8kXzJQhiPT9GVT8rJXiKyDlmBVknzcjF6u+cpzc5iVt0rOujCdT6C
	AGgE+QZe2fuMjFAxrl6QuM3JUO5oFDUrk7G100j5fqgUoeYOhZUdFchaVlWdesOuL8jJWCcQ+ZM
	kfjFtb9zB9qwkoCNFQq4dRB+NzEh5uYksJlpcm9HZPHE6FH7MZ7gE2vDLb4knstqY1VvveuQmk9
	jbGnw+u/xvoeQH9WgnipIPsYFjqSB3TUzFs7u3/HG1IplhopQ9Po+UOWCRKf+S8XCgsrGfhhuRD
	Xi02mRnw++6/RGYBrFQNnd6P3hcGE6+RfpnusiX/4AfKVGcIRa3N+iATb+3jCN8CLPd3pMmK8ph
	oEVct4JIjk6z4rHxSCnWh+F3QfIv/6vFZmG8dHw==
X-Received: by 2002:a05:6512:2354:b0:5ba:3c46:bc44 with SMTP id
 2adb3069b0e04-5bcd42e4cc5mr1286510e87.4.1791481214176; Thu, 08 Oct 2026
 10:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929115956.229610-1-chenyou910331@gmail.com> <asPWQ2ysbTgW9Uib@wyuan.org>
In-Reply-To: <asPWQ2ysbTgW9Uib@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 9 Oct 2026 01:40:02 +0800
X-Gm-Features: AclHuK-qJQ_eUnn0n5swdUT0B7x9k5T5hInCfBDUfhqIPKtNFsPf2EXJq_lKTwU
Message-ID: <CAKspUh+hw3oqigFkHkwUiB_7ZmRrpECA2OstRS_jNF0f1uC9ng@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact information
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 06, 2026 at 12:54:27AM +0800, Weijie Yuan wrote:
> So for the whole v2 series:
>
> Acked-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> Offtopic & micronit: What's the point of rephrasing this paragraph?

No change in substance. In v1 all seven patches shared those
paragraphs word for word; when I gave each patch its own message, as
you suggested, 1/7 kept the shared reasoning because it comes first,
and I tightened it on the way. Nothing more to it.

> Oh, forget to meantion. Now "Aissisted-by: LLM" is preferred. But if
> it's not necessary, then that's fine too.

Thanks, I had missed that change. I will use it from now on.

> OK, you prefer no space between CJK and ascii. ;-)

Ha -- that is the glossary as it reads today, which still says no
space, because I still owe you the change we agreed on. I will send
it, and new text will follow it from then on.

Thanks,
Chen-Yu
