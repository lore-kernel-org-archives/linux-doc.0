Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F15238C41B
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 05:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711071; cv=pass; b=YZPXM8Mq1HBognaswlxWecl0UI+wokNACdceeWCVmqsjCzwwoaQXk6XC79hfVJKrgOHPwHexlh3Za4R2F/VgEBo69PpJq76cPxQi+RUXty7IU379VP3ksSrh7H36V0eUqassljOnNv8LtuVheENAg4wZ8AtPJRCyC7v4Ub8ix5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711071; c=relaxed/simple;
	bh=epmWe8s3QLJXcy4rA2U5Y/B/KOdqRodzVHArrGYs0W4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ih80u0gWmN9DkNv26HL80kb+vIWF6B3riR3oMX/EtX26s9Wqd8i3aEMTXBrzAT3xdlNWq2YMBElU5lWrOLFmm+DR6mv1+D9TVAAEJQobxj2oF90HstdUm49G/aPnNy3mJvFaLuVWkJ0iMHjr0v0DeCP0BAuFuWX6/KavdYiB+KI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AV4j0iMx; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AV4j0iMx"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c125bcfd9a1so82715366b.1
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 22:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782711062; cv=none;
        d=google.com; s=arc-20260327;
        b=H3bNHNTmMgTMV7kSwc2fBmPv8aRoFPaw5OPQSzVR6FNZf8pJPCQ0b85KQGgGOVEZW3
         uAXj04dh2epAnCo9Gud5mdCJC49p50Xb+3Th218Rcmclk2+0cQG+PcTGr1wSLX5168dx
         tkV5TO/2+BEBZ9wiUOR2qdxx09RGdkNLex4Y6Mc5oBGdn4G7BR+8+cfDfaUCIyeN/s7D
         OXla+mzYanOmz1d01n3Sdl7D0wVetno3BXzbiNz/8acRf3G2V2vS8FnFizfMROaUi1Fy
         H3wuxLB9DZR/f4x5WbMt0Ja4SCeLV+34BttNttbDvLwFgRELxu/m/sHP+Qa3EQ5wk03r
         Yq9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=epmWe8s3QLJXcy4rA2U5Y/B/KOdqRodzVHArrGYs0W4=;
        fh=OZun9AXUD167QjVOTL9+Su+rvP4roegNE11vVdDzzGE=;
        b=hivDS0gQhbWXz+GoPIdYJoETB8vQs5VgBhJGv+W/WMQJb1VyX2ijEQidaiWTb0p+Bx
         iBIWAhI1QmrNy7owJe93SBKAvmtKkqn+1+mO5zv8OECQD1C1MLP3oBe0/IQqLlE+QWwW
         9VGu4HRsIUx58GEfuXRc9FsKtmfUpyKUpHb32bbh5QlWh1pbNn5xGwPci+bUZGieAbuh
         hfjEAcxCkRfcxTjRb5YYdXJ5vAGU/sKEQGU+gd5o2szmpUj17mUsjT4FLxwThSages5/
         TVPYJa+yY9TlnDQNOzZ4CVjExDfab06bRS0bX+VV0EeCAk1mr7eOo7cyP44cnSZvN//N
         gOPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782711062; x=1783315862; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=epmWe8s3QLJXcy4rA2U5Y/B/KOdqRodzVHArrGYs0W4=;
        b=AV4j0iMxr+XjllNcw9Eu7cPbbJJRXgdZRub0lsu6FrFGGmGRRomZmdBv4ITGv20bbK
         ijAiIDEi0drAUIap7BTghHqkmP58Fvu6iVRH3nzKiup5rSoPwdZpbvxrOlEc5a3O0uOy
         0nwUaHB9GbI6cdw2ReM4r3WYhh4gY8bZl7AmAXIk6YTzBbDMfLmCl6fklSGkqaSMqkZu
         eliHS0scf2+h5x0y2jZujNZOX0yBLI8ekRw2Q6sObbclqM2zrXffjAUIGVEo4taiVRzM
         jfAZ330NqTAFuNCRZ/Rmopgfx+3P8T5VD8PpotMvU7YDUQkYknXK5rou7ipfD0Vcpuo9
         8Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711062; x=1783315862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epmWe8s3QLJXcy4rA2U5Y/B/KOdqRodzVHArrGYs0W4=;
        b=DnS8VmqNB/xhKZHSkIjXenmRh+svmoW0haonS8k+bF6EIUnh8u9JWknbsch6IiHPsF
         TacOxBCkcnlwQU/0Xbp4Kfccdgsx0VneyPzl76p1R5gbNihcWp1B/I9+OxLowlEfcRFl
         JuAj486OKfSXx0THuEVVKJu1sB0udqsvONJ3VIrmZ2oPZM8Xj+rwtwVk1ERX5DxmcXIF
         4yUgLLrR7z5l95xNW5SvZSR7hBCpaVdfe53t6kzlpLht7QfkHOUkhY4/XbAIotYpYDxs
         d1o0V5eQBEWgRhzbKu5XXVB7CW2QENJt0J7BW0f7phBkGzE6P+igWWeOHbXW6HpPsQDm
         v0Qw==
X-Forwarded-Encrypted: i=1; AHgh+RrM5PKQDRUV1lqulvpU1Zcri4lCKG3Fx1SD+KFloUFnd9HFc4SQfJdVkdvxHk7ZGFb2rjYpH2QN+18=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM9454cfrUQq4JuLU4HtjWxMaTBpVwhPWMJWSMiUp7DSDaJrdq
	F+6mrek8HtvDL+/ZEbZ616gf8ILOtf6LUu9pOubztTqzYKGbdQMIKsov9YpDD5Rmg77E5rw3vg4
	39cdUuRWuhOH/AnNGcTEKO7S3vxYF2iY=
X-Gm-Gg: AfdE7cmvknY32gsMuGMlUMz9dsF8XN93dBvOKTBb+cjgJH3n/z6ncETe9eldriAo3fd
	kpiSIBwuSNYcthJwx6BsG8QIf6XQ6zHJOvoko2r9mRn31qrz8GDxRugRka+tXVWQiGu1jtj5u5R
	yLufRTt34dXBhvyrHUdFuG58k+/W70r1WhFfMW3bZ23UgDyO6wbUCcopQEOqusL8LErRJwy2gJ0
	kM6Pk28q2b6At3uzJWIL7+HISdLP87VaQQw0JR3JChaJsqaWJpMwaDzT9rbNiwuuQ+cMCyk2SUO
	gWa4waA=
X-Received: by 2002:a17:906:c141:b0:c12:2aac:2b4b with SMTP id
 a640c23a62f3a-c12336c2698mr415388166b.44.1782711062080; Sun, 28 Jun 2026
 22:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com> <20260628231634.6752f74d.michal.pecio@gmail.com>
In-Reply-To: <20260628231634.6752f74d.michal.pecio@gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Mon, 29 Jun 2026 11:00:44 +0530
X-Gm-Features: AVVi8Cetk7IhAA3m56dYLZoJwEj6Rfc_rSgjh_WDaPAAo5ultThdmtlYIIEH2Xw
Message-ID: <CAFgddh+AUNH9Ji-Qd=BKEDZWJrzPMWN20-g-htQDPSdSehZStQ@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, 
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> And here it's USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE, but in the commit
> message it was USB_QUIRK_CONFIG_SIZE.

Yes, I have fixed it already.

> Honestly, I would suggest a third option: something with "255" instead
> of "Windows", because not everybody knows how windows queries
> descriptors, but everybody knows what 255 is.

Well naming ain't my strong suit (if I name something, it will
definitely get called out). Do you have a specific name in mind? if
your concern lies more in people not knowing what Windows does, should
i just make it apparent in a comment where it is set?

> That's a lot of capital letters, USBCONFIG_WINDOWS_REQ_SIZE never
> appears outside this function and personally I would just spell it out
> as 255 here with appropriate comment.

I wanted to avoid the plausible "avoid magic numbers" criticism. If
everybody else is fine with bare 255, I will just do that then.


> > + bigbuffer = (unsigned char *) desc;
> > + desc = NULL;
>
> What happens in the next iteration of the loop?

Disaster to say the least. A memcpy in bigbuffer and memset(0,..) on
desc would be the correct approach here, wouldn't it?

On that note, I discovered that usb_get_descriptor just blindly trusts
the caller with the allocation of buf, it never checks if buf is null
or not. There is only a check for the size. and then there is a
memset(buf, 0, size). This results in a segfault if buf is NULL and
size > 0. Perhaps it's time for a new patch to fix this?

> I wonder if it wouldn't make sense to split announce_device() so that
> the first line is printed as soon as usb_new_device() starts, before
> enumeration is attempted and possibly fails.

Do you want something like announce_device_ids() where it would only
print out the first "New Usb device found..." line? and then
announce_device_strings()?

Perhaps even another macro announce_device that does both? But its
only used in one place, so I doubt it would be necessary.

> That would be a separate patch, of course.

If i have to make this change, should this be a completely separate
patch or is it fine to include it in this patchseries?

Thanks,
Nikhil Solanke
