Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4A541A543
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201711; cv=pass; b=GbSKx77zS9w7zrJelxqIgpfgr4D41Dso+cznzf0fLwbKQRYM71gwr9UiUsGOKCcXFg6MxVQVlUi7v0DWOyirpdqC/rye05ttgyWWFMFIy7Rsqr8hH3MjQozxLZ6/VzM2IgaKLpbrlT5v5sIFVZNLq/Xt/bcLMDV7jIjF3G5P/Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201711; c=relaxed/simple;
	bh=2g36lJG3U42LVhfO3LNLyoyHEf6Sd6nntXHxonOuu3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7uTJ87ggHyw2Irv77/jeb+8ZZxsuFj2A/cC38n7H/whNvO0BfhciOMo4Rc5MtNNHZSMUny18arvU4rWTwj+69qGVGrKpSKgeFwT6asRMZxqCuMYBbeC7zUjzdUeuO0BErXNQTOAOiEJ4uUQVxjN4hraJQZNRNhmu3+NXH0/9KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sH6DVVXq; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sH6DVVXq"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so5687933a12.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 04:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784201708; cv=none;
        d=google.com; s=arc-20260327;
        b=rOu8lB7U9g5PeZkT26RYyBtBMkRbsIK2qKh6Fj0lq18bK69CWyGD+hLPrL5k1UExrz
         LnYDwPQFxQNPaD1QuqGCxzcEbiGZLoKMzF7e5w0rPtV7atUtlbCWp9lc8XYIYmEW0ysT
         yGk2U6BW08FlxO3ngUVkWNLdFEhg8g01zwsVwbcIMZJxMil4TaTOamp/UWL1cQ74/CZw
         Do/y3O3/p4Rg8tQDzvf1IGqfBTu7YElr+Whx7tb/fKaiPy6LR977gx5hgQ3ba2WB2ioU
         I/APZYtISZOa+f5Zn/i8JVFGh8fp7IQ1bgs0QzB0L0PWtM1La7qktaNCaXu9MrguOVPh
         Clpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ysGs6NJRebtieFYvmOhVVH9xTxOC+fxmBEZ2c6/Mloo=;
        fh=iSSFtP5+K7qHiIoHIP1gzHD9VGPXT2xUMTsqaRqsQqw=;
        b=ELfpsPjMYOtqCw8oBCJzRKPRmXb6vrv5/D1q/A0zNgVTWFMUG8lmE9FHP27psI5f1x
         mv0ooeIRW4ENHxoUy7CyB1UsTPOplSsgkKfUl6snM7i5ngtkj5GEbGjBUDxhbrWdl5a2
         NPpKwjC5Yj1DBx2Iw66VSvmYknQcc3baStVfS/K5sBl19mXuKdkc4uRbKaCQjbRdy/Qa
         MllsrOFZMphd6fQ4Uy0oTBJMkTGoY4dYZve/Ca1qzDgqPAkAGizzCrrS4VxOMqZLWf0g
         oZVXysaPw7WXXEXPsIQHbuXEmc2Eq70E6/eMtOEHJ0E5VcGddVvU0YCvtgIcfht4KN2u
         A4tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784201708; x=1784806508; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysGs6NJRebtieFYvmOhVVH9xTxOC+fxmBEZ2c6/Mloo=;
        b=sH6DVVXq+0bg3bPner6VRTSqoa2TnmHudaeImn8Q9khwE6G+Wj/ZRDZQCNMvYMGE6c
         U0Jc2n2nTwe28DA90oSUI/88WWw+vm0zezAwWXQDekmVbUEjKui8EcgZuDwgzDRFf3lI
         NvwK1U6x1WNnf4xyZxH+Uoj3f7zDUvGJkDuo9xlWqxM6mbSbqVDf9B/FxDrInBek/6dg
         2hXrFapKo31BWuZnufLfLc/xkepV4JWiLPxhgI/d2hNf7bT9pOpML7e1W2glo47PUl42
         nCyhgutrfnWV71ebMaVGA8tcod4ZSL1Ng/FjndAN0owl8CRTmggDyjc7/VKtMIsjV13I
         0+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201708; x=1784806508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ysGs6NJRebtieFYvmOhVVH9xTxOC+fxmBEZ2c6/Mloo=;
        b=A7jYKsZjUrnf2Jqdipl/CYY8QCnMmmCRmasGHGm4dr5mWDYDuvoZkoUtkpWCQEpUsx
         NMOb2AD0mkpjbFNy/3BLHIbCNhrejEcQSrE5MeiCDHOb1V9ZmPYPu0m9aBmIS9Cw6p+c
         ANvaTbCtQA82KXaw8VnNXU+esaBs2FZt4kp8jw9clGdB57Y9h2pEjHp9V/Xz58ijJ8H/
         uepCkehL54urYo5LcRr5ouOB1J+DZdf1i3TlGO+PCdvLTOnUgxSYVKlkLXRWmDiZhpvi
         TwEtIIvLzrhpUqAzO35AZVTwISKO+DQMXmDIpZD4x5+VWXnXeLG8wulQyZQhbufrxU8Y
         JLyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlJb3T2c28+nWUpZjb7XLEoHZqhVPza3L+tHU1tTnIW1En8CT60ZolSpuzqxhawbfqeapxWLbApF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsWA+xx3DGBWXRn/3MLesL4WjB8J5YfJMYyAkzzR1MmLS++JTo
	kcoqky60mdrwiDDywJzLsuQV6J6JFjT+dET+4oNemVl3fnE58bJ1NLgHxutEjxunJuFQuxyeOXV
	/KbaLQHBEUsgctwbe05yuk3Ue4aKvJLI=
X-Gm-Gg: AfdE7cnddpcOmOQaS5GHvL5NY5w501gj/xS9lRIyKWiTMOZrsaIC1beqilmQZQhoFRY
	F4c68l9RTNoWEAdNbAngAVxZZEPA9Bi2iqCnA75eN1STNPiB3yRkV7i7tKx+5hkp6URc20pC0B8
	bkcz3iZ9lB2nJeXVxVHMteFHlyh1Pha2h0s14+9oRS3LbWgfHizfnFe0uwSCf7DQr3J+Zc+TyxL
	E+Zy69Qx+YkwrmgQp6f10yLFapTc6F2c+21fMqLXJuybV+56IVTvZRIzvuVK1JIs/O6CL+UGTyV
	Wx8vvw0dKVNq7SRGdEMZ
X-Received: by 2002:a05:6402:320d:b0:698:50ea:2d97 with SMTP id
 4fb4d7f45d1cf-69c5f1043ddmr11746132a12.20.1784201708206; Thu, 16 Jul 2026
 04:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714020340.25014-1-akiyano@amazon.com> <20260714020340.25014-3-akiyano@amazon.com>
In-Reply-To: <20260714020340.25014-3-akiyano@amazon.com>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Thu, 16 Jul 2026 14:34:57 +0300
X-Gm-Features: AUfX_mzK79CIL23jkyupbgkP8ZJeyWpMZHgLpxQaHMyTfs3qKuX1sAZ-6xeJP9M
Message-ID: <CAHfVqdWNk0QmvZBXi21eUKcU34DpXXZBNyJVUep+Tx1n52ihAg@mail.gmail.com>
Subject: Re: [PATCH v4 net-next 2/7] selftests/ptp: Extract
 print_system_timestamp helper in testptp
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Wen Gu <guwen@linux.alibaba.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, David Woodhouse <dwmw@amazon.com>, 
	Yonatan Sarna <ysarna@amazon.com>, Zorik Machulsky <zorik@amazon.com>, 
	Alexander Matushevsky <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, 
	Anthony Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, 
	Evgeny Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, 
	Benjamin Herrenschmidt <benh@amazon.com>, Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, 
	Evgeny Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, 
	Amit Bernstein <amitbern@amazon.com>, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> +static void print_system_timestamp(int sample_num, __kernel_clockid_t clockid,
> +                                  long long sec, unsigned int nsec,
> +                                  const char *when)
> +{
> +       switch (clockid) {
> +       case CLOCK_REALTIME:
> +               printf("sample #%2d: real time %s: %lld.%09u\n",
> +                      sample_num, when, sec, nsec);
> +               break;
> +       case CLOCK_MONOTONIC:
> +               printf("sample #%2d: monotonic time %s: %lld.%09u\n",
> +                      sample_num, when, sec, nsec);
> +               break;
> +       case CLOCK_MONOTONIC_RAW:
> +               printf("sample #%2d: monotonic-raw time %s: %lld.%09u\n",
> +                      sample_num, when, sec, nsec);
> +               break;
These three printfs are also kind of duplicated, I think mapping the
clockid to name first would save a few lines.
