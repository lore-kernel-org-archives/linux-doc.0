Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9696E4398F1
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327760; cv=pass; b=BW9T6nH3QPH2Hvq1iR3TeRCuHrrKrxy+J9NtsMq89FVR43IXyDYR90latOeBjebOEmwQeVK2I3BcFFM4Z+bJuCDt2/d6PPcqjgHuiJ3ri2ZuPtluo4UJKE9vSv4ggHI8IOLMPnE4RQi1xF+eVAoEvCytxo1eK2mmThNxh+rHklo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327760; c=relaxed/simple;
	bh=i3Ivr+vW+5pfaXTRvvj3VPDQIJ3j5TWmvr2JXRInVhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdGyf4XfPk3oHc5fERz+uvYsUKn8jyQgPkjQbLdB52nH+SWfqCCv+xCBsLT/usAJ/SPjp+UJqjlinnN6/BzHcY3shxZay1QxoVN1S3q5Qqx24DA42JliRYZ+uOD0C2BtOnAOJiFPmMEj6r0UkfNCum6F318sv8OR1FNbzz7EvL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/j9QDEN; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/j9QDEN"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebe49b227so207819e87.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 08:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787327754; cv=none;
        d=google.com; s=arc-20260327;
        b=XWh6zt8o5NDS4M7khbgIVIFi5HLvcKxMzh7iV9GjQre4ED3dFyPAwMws13Z5/wyhVO
         D9ZVOD8Zn7eNRJhk5fvyrxpGlmUzI1e1RTysjX0YaJmDwoIDT6Ecjn7ts6nUGxBEpc1V
         GVwI2fhxlmvE24YcLVxXqVc39a+wSwQefRblbrpGR0uSBUKqH0pmszOJ4EQIvBwPd5Au
         kOyNvchdtotmMgKI3wTE+wrud+u7Q5gvhKKdhCTPNcYwAVykyCPmzpBZ52QXEu/XRxfh
         xL4C1CyiYYCuVszQWowl4+5OgrWpgEAbnbXn40DBzS8Kb0SLhp+dMjXLUgxJPvSEcXXs
         8RXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i3Ivr+vW+5pfaXTRvvj3VPDQIJ3j5TWmvr2JXRInVhE=;
        fh=Nl2tcv/0AG02gIdfJQddKePNt6JxxFrIe5E37d10G6g=;
        b=SBXUji1XTn34M3iR79vyJ6Bt28bU5PLwEQrgY5VMEgYcm/KVMK/aHYudHvo7gqZ06Q
         AwNKMBme3CobL3g+AzY9tGgHtNyRgvqKk0BzvqrORELAufvgTzSw9wwgD0G7O8DHIrUF
         yMyLFXeSdL9FkhldIwcVkQHF0firKug1icK49eisD7E27mC1PxyyeVPLs6hS13QQSZXH
         2sf95lX086kaTAMxLqyPoe1ZdXDeRSQhazua6S1AQ9s0cc+/SzUaaMkXB4T5TFaRV9/D
         5iMMWLX5BMl4JKnFbFz4xxrkGbz4Q/y3lYavRiKGRtonGlgGR3PijYGKXegEkGLXAOKr
         eMIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787327754; x=1787932554; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3Ivr+vW+5pfaXTRvvj3VPDQIJ3j5TWmvr2JXRInVhE=;
        b=V/j9QDENEZnpDXfosCfHU6q/QKU9xynVVHkHfPuYNjc363qixjzXYH0nLyvJsV8ddN
         mbXA5s+oAKfEN/ID8rak+2cD+zY7beTe3029K+/4UYGKK2FDehAAzbCiBY5RQRanTpp3
         YyboB8Tm64D6nwLwxnonv1e0oOLQWh0VoU7BLHWQniefJfheQF8QTXe7Gqcmznig2llA
         e6mn78xABYXifH3HHyykiVuDiI0XzstJSdZPQ9l3MvlvthPjxiPWDXRZlmkhoS2N2KFR
         N73iMbuSeG8fNIAj3uA9qL5MZPsH/dJRuDes/xE7XkwhriOujaa3e5CGBXHkMr23VD8V
         BLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787327754; x=1787932554;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i3Ivr+vW+5pfaXTRvvj3VPDQIJ3j5TWmvr2JXRInVhE=;
        b=Trra4pEoJxuFBZiR3zAkFAYFpS5gMrK7Qo3xhSYRcPjR5U2nUYFS8vhp7rG//v3gZ+
         XOOd4E5+rY9VJ3VzgWtnu0rv4I/dM1aLHuQQZcfqG46unCboJ4vfUb3BdH6mHTo0Ss0Q
         kGhhuB3PUSVJL4ycyQ2umOCb/D6u0tOYVrQrtwhnwJ0aLxADu5gxurDWVINo8rDuiyX1
         D4YObrzqMuiBp27HDO0+sD0RWpc0/pU5ccHmMOZ/5AErgfGUYiqiIri/GZq6mB/yiAYA
         K4z/6e3ql+EzJsUTgbIzgonQ+Sh0NaLkhVmW+XTjJEF6bjZgtSTqyyJzRtxgJ5c4oPkN
         fPHA==
X-Forwarded-Encrypted: i=1; AHgh+RoB6sBQHONa5mU0E7DGzrM/99blb7qUxyaGgz46tOTt8xNi4/3+RQrB2LnOTCj/IazGtwyzhzMCCrA=@vger.kernel.org
X-Gm-Message-State: AFuF++nOOsK79rwKJYUVQycm1RTZotyX2S5uqaSva5FCIOIckg0dVqST
	v/DFpb/3+JirUoOLPp3TWRgbTVJu1Nz0UoSW4KoD70nVagpgaTxdBZqXfbEhXjz0YTJBYiAPdu5
	c+OMGhR7ufyyJHC+ffkbI87vi3WqDhVs=
X-Gm-Gg: AR+sD1002hnfVsSl/oeU+uIbjJjWLh5BgZLxQERL2lkNKGAnqe6YN+cY5J2dbYZJyGx
	+1scpujIMEQDeADKvMCeB3s9/iB3H16NlwuTH/lPE1qC+pF9neVo3c5sXzunWtNQVv/UByBrapB
	3iqlWTsPAFG+GxIQ6+iHfvPx+sBhHPjlM38DanjKiiKMTmtHp3MGxZI2L3a9dKFzDfIjZlF9eHw
	7HoFcIh/tXG9BHx5cAf0akMtzu2WyFaQfMBQGi2BFyuSfsP2XRbHkuASZ6K8j4uy+49Rt6otnLC
	+/rIPvVlRDpn6AsEB2XBZq4BMB9NZHF6I/I6CznWjxEDZmqIh/ofj3+JLL3x+jzV25aZqvQlzsR
	hPhBhDEXZRs24Ax2YZ+N8fm9QnAk=
X-Received: by 2002:ac2:4f04:0:b0:5b4:59a3:c67 with SMTP id
 2adb3069b0e04-5b48422f8b3mr1089182e87.3.1787327754297; Fri, 21 Aug 2026
 08:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-apply-patches-tw-v1-0-c182c1c425ba@wyuan.org> <20260817-apply-patches-tw-v1-2-c182c1c425ba@wyuan.org>
In-Reply-To: <20260817-apply-patches-tw-v1-2-c182c1c425ba@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 21 Aug 2026 23:55:41 +0800
X-Gm-Features: AcwNN1X86S5S-L5hZtVSmiMHEthSQhyRUw5HVmHjUTOVymF34hg9KbklFN-pxM4
Message-ID: <CAKspUhJLcgj8kdZ-Gg2b-v47zNnfkHm=q1yvpFxr__5_Pa1DeQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/zh_TW: link to Traditional Chinese
 applying-patches translation
To: Weijie Yuan <wy@wyuan.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Two small things here.

1. The two files use different link styles

README.rst:89 uses a bare path, which automarkup turns into a link and
which doc-guide/sphinx.rst recommends. howto.rst:149 uses :doc: with
the full path as the display text, which is effectively doing
automarkup's job by hand.

Either is fine, but they should match. If you add the
.. _tw_applying_patches: label I suggested on 1/2, howto.rst could use
:ref: and look like the eight entries around it.

2. Unrelated whitespace changes

Both files lose a trailing blank line, which the commit message does
not mention. Best dropped, or split out if it is deliberate.

Thanks.

Chen-Yu
