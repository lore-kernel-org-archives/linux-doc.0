Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768008;
	b=mwioCrxFg6ifjy4CPbMuiPDNnGK4bUV1ai3VkObz7w5w5wLUvUjg0FmrPVZc6vZba+dt
	 dKqVSuJ7vsMI/zXfpv+l8bqsK4PyTFEjfgC0PKmkPCQRTLPwSOFg3YPY+b5yjlaYeevpB
	 bLIrpOyU+ZeyhImLCx3HCCnrdtSYtge9/mF9XVSEClh3jCvD3ch1pvb1PU5DHc1iUdnuX
	 Hql1KHlf2JiqyMmqKjNN6zOtbSeMSVkOw/fMyaV2Ic9jpS68FU0EWq/TUOEyvTp7v2rlM
	 s5fnpIRTEPQqP4sPiz0KvRXWIQTGSnBiEb3dm8RM2uM5INTNqQUiCvylDj6EQwVHeQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zNW6XYlrtwS8sApdzcwbBz0IcIsSvhwmpXIKiapenBM=;
	b=g1oMmlPanUsHTXpyELHZ0UAxHX/b0U9sJVZ74kgPkkJFZJmu7QmIr8nZF+yO+NHvrzz+
	 b3weqRkI6C5Y9KaJmLhHV8heaydOSf0bkAy7o49+YpbzQ02zMYuVshvPw/a5chO5qCs1l
	 6fRIilyCtkWV9wGagQcuHYfBLROO7oAToWLDtZYfNiZD//vtdmPwM21nWZ4XxrUwQla+1
	 9TroT0uPJEVMS5olK//xvT6w1w5btzwPSCvvusOhFUYMqJQZJ4HbPGpgViN+Tt60+xYSl
	 LF4GDFuymGQe20r4KHgwNcBzvMOm4yhEOotv7B2CHjS02N9Azlgo9OhBBrCFj+iVrPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KVJ9FXKu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1BA606A31B
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 15:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F1BA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KVJ9FXKu
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so12626a12.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 08:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768006; cv=none;
        d=google.com; s=arc-20260327;
        b=OFPU8v5wUjVjkQSiBK3dJbofZqcktUD57Ap8RRcTnlhOdJ2xqS+PNBcmlJqhRi5x+l
         PwJ6gddntmbvJDSc/tbZF15iEjB91naz5I+7GJJecDIl6TMAJymaQPPd3DHQcOUzgMk8
         0IC0HK6WCc5pBv7AyGsweSUo1auaSB4rP8c43Hqtloyw8VpQLIhqa7ukmbevFZe8yrj4
         4Szvg7mPkrdPQrdfTzklgNPr0I5obG/GwLHuuTURjDuxU0HEOXyU2o6tNDbU/WbK6Mzw
         iA2n4ngPTgf1356L1qG2n5vhp/+Lje5OX7GDYcFZ2mBuPvjngc6ogTLZh9UhgOnd9f0P
         M2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNW6XYlrtwS8sApdzcwbBz0IcIsSvhwmpXIKiapenBM=;
        fh=IIWgGMRpVsPj8V2VF2hfQMnj5mn8bY7Qmi9Dw0ugHxs=;
        b=PUVPzFYy1WxMF1/ISujzbrZCMrxtq/RboX9HavUkOpUM7xKN2Tk1uwEWbW6iynMGa8
         kdnAs4SWM3JhqYsimnQC9et9L0uGi9P8Qr/PAa7VMV2Q6YStwDInulLTMWr+0NevyAko
         IcJKMuRfOsLq3LKeHLcIL2fANP6PDoHVE9nIRMzEHd3REredj0eLxEE+BI92oO6Eachc
         bk8Hvrme1KwzXE2aypi1Qa1EHdkGTFoRrkMYz9Mdaml6405mCBY9jsXnLFxzpchgmLzV
         Ag09JM/ORTfe98m/ilO+dxQ2vPILJYC5P4JiRb3+rpMwFZEB8jwgv0skjH5wk6pe5jst
         4M3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792768006; x=1793372806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNW6XYlrtwS8sApdzcwbBz0IcIsSvhwmpXIKiapenBM=;
        b=KVJ9FXKuxZw9511/Juyf4W9Ir2Z0uLB4exJreByU2W1txP0+Hq/3sBLO0/iYx2G7nK
         lyl6usjXdqPwD0cI1SmvOg4V1aylyH8Gh+SH8JlzdA/9/ZJZfnE06F3M1g+JlmTR6n4j
         ifn03DAI+dswyUbGsOHxei7RWVQsTJeoTJWvtHj0B57Nm6BkutYTrA5rS/hpTHxlOTVR
         BwRzz0ZKJjB4KnZ2a3ieSu2N60QZsTsTwgRfGKnOAHVttL08H/YlMmOgwo9r1nBjAcan
         XUM8S2YsyHtSYuB8sZ/a2+/N5QlVaB0Hi+kBiJqOIHYjVzMyIfU/ckwtLYk9Nz15a0V1
         l17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768006; x=1793372806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNW6XYlrtwS8sApdzcwbBz0IcIsSvhwmpXIKiapenBM=;
        b=aQuA0h0Sf7enxArj+rqA5sRWHKzkIDpbI9//fLU1OJu1kg91ZAGyfcXGubax8mXGgC
         6u1m28WrA3GklssRU3XMkTLS+HVRi7oWKwUtlEtCVq03wcMV92MeTDXp4muOSE5ZV1E+
         nc9aZLHu5x6DjpRjYLa+sgm9UXq4dhpyNNmDYFoBB/ebzs4jIpioki1LknyMGSLYcoEo
         D29Mmax3+AOAjNCAIKBasSrxJBr8+/bUIjHNXKvv0y7C66rpKi5TNCCgyg5eHtyERyrR
         UDa3/ltcqiyzdy8N5Xew7CZM3Yx3Jf/QCcZR7O8L6sWXtaSApxL8ASS39aIFF8qDWYhP
         hcxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzWbxNBJjcSgHz+TMolC6kkeFU4QXxvmwpYfiMo5nnipc5K+7tKsbb1564taztahQ92xJZoST9r7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsCXnGFYZEo17rUwsjS0way5SlNnSYVSVPZCEcTuTLSID7A7NR
	Cpuh0cSHlhh1LaFkcY4U593Arva7wG4aJeC5ry1+Bk6apgYus2334hJz2irSZB8e8hNLxwgJ9Ao
	/ZCl7EMTQ7oT3QrgmhGT3/yIXBRQLo07XUPGTeyCj
X-Gm-Gg: AYBFou1+YPFeSz1MZcCVGn0tW44U5194Q9tp2JXTfUhr0xyNRiBgm4OIQX4HCUGrQ9J
	7RHlqv+tV+6C3QSLxPZDFRv08N7syft/fqtTzR1m3nGBD5K+koOQQQy7nzSYw7FRKUKe2nscd+k
	C7ktiUsuv8HYPHs1eJZlFBuQ2RHClGetFQMC/MYj9FcwKks1jbkXN8PSzgqw00c09oyawUT2yhN
	OFMElS25oQsa00vYrmhxSCFjPhC53p1ZWYHQ8rPrQO3sHxna6EOtjwIW5NDh/h8we6sdcOhr685
	RuW2xGW1wJ0x49kYUNgj0mvM8StuD1jIN4myYfTr+qiyps78SJHY+e1taOhc+8htIIK8zh6qD/q
	HmGUOpZOj2hVnifIH8ngJtkteSzhJO81FeaUGA9NT/zmPeKyc90/xuj9LpkJNrE4eEqmf55ezey
	+ieQt9QZd/HVRRMUYHavSC4MI=
X-Received: by 2002:a05:6402:44d8:b0:6aa:babf:adeb with SMTP id
 4fb4d7f45d1cf-6b432d316bdmr68184a12.4.1792768005447; Fri, 23 Oct 2026
 08:06:45 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_31D2FFCCE76C50A695A1270151F825E90906@qq.com> <af2ec5b0-7c62-4c6e-a28d-33ed401020af@linux.dev>
In-Reply-To: <af2ec5b0-7c62-4c6e-a28d-33ed401020af@linux.dev>
From: Neal Cardwell <ncardwell@google.com>
Date: Fri, 23 Oct 2026 11:06:22 -0400
X-Gm-Features: AclHuK-H_9kcDdlRg4oJIo1R46Cqrg9YXsq9lGWJiBUgtLV5WO5v6PEgZsMeA1Y
Message-ID: <CADVnQynhY17Romr6VvzAyq-9h1zQ8gd-+pfC+1qFtz8xRaqCYg@mail.gmail.com>
Subject: Re: [PATCH net v2] tcp: limit tcp_tso_rtt_log to a valid shift count
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Yingjie Wang <1075151112@qq.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	kuniyu@google.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 10:50=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.d=
ev> wrote:
>
>
> On 10/23/26 10:40 PM, Yingjie Wang wrote:
> > tcp_tso_autosize() right-shifts the u32 returned by tcp_min_rtt() by
> > sysctl_tcp_tso_rtt_log. The sysctl uses proc_dou8vec_minmax() without
> > an upper bound, so it accepts values through 255. Values above 31 make
> > the shift undefined.
> >
> > A process with CAP_NET_ADMIN in the target network namespace can set th=
e
> > per-netns sysctl. With CONFIG_UBSAN_SHIFT=3Dy, setting it to 32 and sen=
ding
> > TCP data over loopback triggers:
> >
> >    UBSAN: shift-out-of-bounds in net/ipv4/tcp_output.c:2264:30
> >    shift exponent 32 is too large for 32-bit type 'unsigned int'
> >    Call Trace:
> >     __ubsan_handle_shift_out_of_bounds
> >     tcp_tso_segs
> >     tcp_write_xmit
> >     __tcp_push_pending_frames
> >     tcp_push
> >     tcp_sendmsg_locked
> >
> > Limit the sysctl to 31, the largest valid shift count for a u32, and
> > document the accepted range. Writes of larger values now fail with
> > -EINVAL.
> >
> > On a UBSAN/KASAN build of the net tree, values 0 and 31 remained
> > accepted, values 32 and 255 returned -EINVAL, and TCP traffic with the
> > valid boundary values produced no sanitizer diagnostics.
> >
> > Fixes: 65466904b015 ("tcp: adjust TSO packet sizes based on min_rtt")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yingjie Wang <1075151112@qq.com>
>
>
> Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
