Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A581A9F87
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 06:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784875033; cv=pass; b=Qx9YAShAmYydTe8FU+K7qXRhzGMcKEQ5zvH3ZfKCkUPJCYXKXyfGh41YrDgkK3iqyi+ZT7puatbjizmePEDhfwNQWA/1Bj+QBQHnTHVDtkWKcnUfR/wGV+g4+fPE8ju+IsAfOV02F+yEC+n/8NiBx3LQis7EnQc9rmidk+UNSR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784875033; c=relaxed/simple;
	bh=P2y37hqASEJ6fcIvj0lM2m+n/i5Ow6llV0+VTCB4O0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSWi5LIZuFnl9cmwJxnYMZBIoCoacUdZh2PGfi31KRIKSu0lAC+nKQzGk3j9WGJSa3RqVXx//R280JFZunJAY36tx1MEmwrk4TL47a3/t8AfGsr8NHlo1Zjo3/qwvZyMo2A5+Xkx1KE9wkNYiCh+HBDy1OjT3mTTWxfbcJ0y74M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L87JbAbX; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L87JbAbX"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeafa51b5cso11037e87.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 23:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784875030; cv=none;
        d=google.com; s=arc-20260327;
        b=p+uqLkgr+8p6rP9wjV5qJA7gRRCnsjS6OL8DlfijQeJAkF1cWIEB8Lb+/7WWpDC/xd
         Q536C/ebJ1Rdc3VXvKKMgtpN3ThAN50T3KDurB00LAaAtsRaeT1UDbpW6DWzxbEApZo3
         N282rRTc3KaoPMvUvZNAQu7cdLNgbRUrlkB4dp76QrCpD993sxuza6yMFCGsianX4ps6
         Aqn6DtjWUfBUkvmWTAvDlpC+2lN6n8HWNwgvIRM5fdAWCX0UIBmsyxW5DdcN7cGwEW3Y
         6mwOsvTXFMBHqUffn5OqSdy6fdhpUyYvQNl3lSs/H3OcOl/ijJjLkr/cP+Yu4+JudJcF
         V2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kjE4XEo3aMhjzXkV0J9Rrf7DoDavEqZPeKg2uni4Id4=;
        fh=He3cnlZL3fEJBb/h9ybyU808ZUuCc1PXaAqRJ82OZ48=;
        b=plyIBANU0dRQCNisdxdAXpddiniTXt1AB+BoeZ3zA8+vlSyjkO8m0KjBn1v28N9DD0
         OwOzrhGr8ZGGf4W0+xBtCEV4Cz+I8AvBMExrpnd23BCsIRZ3KT8iNKClYD452hWcvCjy
         Nbzc1XbpS7Vzg+K9rXz/DVNxFMiKms+bkr7qwohqg6C6yih3WXx6jMjIfDrXsPuaR6AR
         wggKYjB5pfXgkK3JQBUFqRhKPmGU9IG0ph+5jP+sKvpSgKYTK35oLSCTqbghpDzoZg3Y
         QGocUQ7k8EKYpO/WrTtPszX8C5WKbB66K5UIiMSz2aBkDf9zQCo52JCH96RXZZLIr5l2
         CKVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784875030; x=1785479830; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjE4XEo3aMhjzXkV0J9Rrf7DoDavEqZPeKg2uni4Id4=;
        b=L87JbAbXLcS3op6Mauu2E6epRpxSerBxOwp2x7f4v25Z2eoRzlGjGPsUIsAcN7oKv1
         kUYwX3oLjb5RQnM3bg07QgGrYDJEoxgnJsTljiReaDROvkLDHapYaI1O2pKLL/yZafoY
         uYcgmCBWa0FlWrDTeUkJehcnPwHQ1CKcg74zDVQmPHyzpzqeqrLpf+AqF4P4MzZtTi1D
         ZGwQtF8yORUPru79pCeqPKvP9QNIAYav9kkK0WBjGpWTnamAlIg5aCIfGzC0jlVREx5l
         EjbzbLrapTh2jNPk2RsznlHHbBnYMIaSBG8Q8TzNK9O/Ev7g8b+EsfMfWqrFL07HD6Me
         qJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784875030; x=1785479830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kjE4XEo3aMhjzXkV0J9Rrf7DoDavEqZPeKg2uni4Id4=;
        b=o9zyZfThoRezJEojQiR6z2s/3Ii3e+0IZnYNzjfrgYW4SiGxyZ2b06CZdFUJOCKgp3
         wjav1XR6rq2IIOeoWVfW6e1PV39TNprW0DxWdxWmM4fTh6nNagHL+eOTkUzO9dS5xlxC
         w+cMJvS7SOQomDcXrAHli42ITWEgw3/R6Wfrya4FdkwmvMSS74GJ+9gKb5+pDZG/6dqm
         lwRUKDbo81GtLFg7PjNPtM26seQ2sJ2liDmyFVpkdvfpkHl4rw85Wv0RK9aQmzFB2f8u
         q6XWSUqFnGnPd1sfgi4onjxnelOeScxu5Rr7APBlPF6yG9fF5QztfHIKfwOc/PDqSthS
         CvYA==
X-Forwarded-Encrypted: i=1; AHgh+RopAx2+0QF42qqJl2BwT1EKSZQj3En9is1b1nwBiBtGJ+JCRTxo+PsfrLXHXaK9wLXHmcrwYXXU2j0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFR1opzgHZt96RqHeffMqqSRfH1uEzFGTYM9TkGtw5jibYOmU0
	iHRkSXAnrmvBtLkcJBLY0kg3k/r0anDYa/OyLibrRGSco3eB1U/jSBD0YP2Z6T5PkifkAIVmd5w
	43bp8hq2Cwu1lmH40yKUJLgr4krHlS1I=
X-Gm-Gg: AR+sD10f2L361xWKVg2KNHYhCSe6raV3E8zPWAYT32YI6XEaBpBeSB0lT5XcB6Pm1RN
	Zxb+g7J1AQlRW7yDEqAP5cMJdMRoza35ZmkEAfSliGWJDhoFCD4nMQhXSZyuWHygvk5pDmxd/GE
	17WmEmOmGjw7vKBcfne4CSSMe5QwewV678dRyD+oTIw1a5On169sURPuiRmh8pkNm6T1OTGPJuh
	BzwSyRrZgY+IVOFhfTHMERVvOP86TGq9T+WhFafDhIkHvivPM+D3vxL733thWGG3XddnVWUs1qj
	05/hK8KvWehRAL8xbJRn+q6YUXU5sD/AZi8cziwP8uaP
X-Received: by 2002:a2e:bc17:0:b0:39c:74ef:1a87 with SMTP id
 38308e7fff4ca-39f174640a4mr2646951fa.2.1784875029691; Thu, 23 Jul 2026
 23:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721215542.98435-1-chenyou910331@gmail.com> <amDdPZ4SqBNg1kBa@wyuan.org>
In-Reply-To: <amDdPZ4SqBNg1kBa@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 24 Jul 2026 14:36:57 +0800
X-Gm-Features: AUfX_myPugSYHAI0kaAQCQjElSPrYW2YXzsl2CfMkECdt--cdwJQiZ3aHplUA-4
Message-ID: <CAKspUhLDFuEeRbu=bjELt=qUrVwgm2avBhcEZu3L6NBZ5-RBNg@mail.gmail.com>
Subject: Re: [PATCH 00/16] docs/zh_TW: localize terminology and sync process/ documents
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 22, 2026 at 11:09:49PM +0800, Weijie Yuan wrote:
> So the ref for previous commit is wrapped, while in:
>   https://docs.kernel.org/process/5.Posting.html#patch-formatting-and-changelogs
> It asks do not wrap the ref of a certain commit, i.e. keep it as-is, in
> the "Fixes:" trailer.
> But our case is not about the "Fixes:" trailer, so my understanding is
> that we should wrap the ref of previous commit in this series.

Agreed. The no-wrapping rule is specific to the Fixes: trailer, which
is machine-parsed, while "update to commit ..." is matched by
checktransupdate.py on the hash only, so wrapping the title does not
break it. The zh_CN how-to template wraps it, and keeping commit
messages within ~72 columns is the general rule, so I will wrap it in
v2 across the series.

Thanks for the thorough review.

Chen-Yu
