Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225F025F7B9
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296553; cv=pass; b=EO9/7t6XxEedc0GdNujJGfzoKijTq7I6ws8hS0lSeAQirTQnqS35Gijpsc6s5Lu4heDLz+7X4GuNBx+2cxnKZ0MQu0wNJa8AJ1UG6YjYatAVT8p2abYGNRvBy9U+VZPZNCZC1PNSsvRfO7ELQF2C2yVjfg58hspCKlQTl/La/gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296553; c=relaxed/simple;
	bh=ttOxTLTyPZFw45AjvO64SZB7KeNqzOI5QjgWbzctOaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZxkod2M+iEGLj/ikufkD5PjL0Imj94e2IHYuc0uhyw02mUDV1ZhIPS04yDNVGCNW9EPcYH8Id+5suzGjatOCcxIkopZfbiZkxyvDk7aNAOmlg4ur1zymtpksf33CxUapywELbLAPx10Y5wZm3rgmxKUpG3mHUOhEseU28TOshA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffMx5XrY; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffMx5XrY"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b014810feeso96247e87.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 00:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787296550; cv=none;
        d=google.com; s=arc-20260327;
        b=JaboJfLgiu/zgudTrPfbi7kXUbHU+JpcHkwxnSpjSm2pJm2SnUbkzFjIqUFEXZhMDr
         IBOfBKevJ8C5XQBVmXc4gDh9itq6/mvZntzKNUN73TIRleBPD1zNM3kEqBUC7Yj429kk
         pnx5/yjuIZcXLpev+3twd2c/Gi1CFQ1PCjWPZP5STGNEJhHkPNLAbWU47YUSyMhJWIat
         rAvPTKkgt8qi2BMg9B4Xf8MKYpM1giEgBnLbxEauPPNYzm+hKJHTC8+OTWkwRc8AkZV3
         lOH7HDkShgKYgskfLfIReH5sF083LRcgpB/u4QALc/+DX2cMPEDZavyMBwFrI/0iOC7w
         X2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ttOxTLTyPZFw45AjvO64SZB7KeNqzOI5QjgWbzctOaY=;
        fh=Q5Bp+c/g/SImoXDmPZ1Aqioezt0gNGLP6zE+HQXbjQc=;
        b=jVSujlcyRZCKZAlO9Q2YSFIbSN83bVSKWf2Um/xcKV0pn+2ZN/oRoBNEIm/RhljNnN
         EMuYlb3uqmhXCOz5rrm9Knk4SQN6QEiPlePBuL222Qaq/ZzFtgbo5mcUX0uLSnWypwoW
         W/DTWapQlJw+pb23QhIaLHRh3TH1tVeEmmDljVigglV13Ync2jcxH8YrgKsmeek7nFJo
         0eChBFP/4LX+zxcJf8Jm4zAVuM3lwk8AhyRxVZ35uXZIsn8wM1Hj649Mt9BixicKh69P
         aH4z6LzYYTi2E1lzdRb69I6w8lMfR3VWKdDkP9SnyxJrJjcJ5m4pOw8wgFm27/WWGMfE
         5plw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787296550; x=1787901350; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ttOxTLTyPZFw45AjvO64SZB7KeNqzOI5QjgWbzctOaY=;
        b=ffMx5XrYYJ/R/zA9eg9j5FUgMtJoAivpObt3RycDcfCa5yCLPB5PbKoNk8FFQ450qQ
         jqtiEhV9vpaQunqqwh3jlcJ9uwtBVi3crRlBT4vipTncu1fSOKAHrHx1DToEwWEWCYZ0
         DsmH4cdDGdSv9VQeiltddOYzs6pN9vd3Qc0z1Wi3KzOt1OHlMGRjjJHHiEe+lSqrzwlv
         LDFQbmvynQqBkSYkwIlQT26C0ztcSvnK+cX9sFXp+qYytQd1YdOmZUVG3oTeP4qP3x9a
         WQf/SPAaJKx1muFqv3HTRPivs8eIAU33H7e8D+k09L2ADhhli9mNpPwwD8mXfRrLApXo
         ZiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296550; x=1787901350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ttOxTLTyPZFw45AjvO64SZB7KeNqzOI5QjgWbzctOaY=;
        b=cYxoQ4ijgzGPEA/x0QAv4HnEBaJq2JI+I17xcYc2vaqs+GqDDEGLqRkYQNNoPbt3dT
         UsOS100A70a6W0ghicYrMKbF+3Dgl6pEKEFv3AWlpz0kmporqOUAobycVTzZE2jsk3lF
         Z0BKPSjUHHaatSCBH4rNzC3/B5f+vSk6my1QQomxQcDeyronKWefD9/Bmao+mOKMV9Mj
         NdTzSgnOP0rql41pel+EgpDJdfvWRI8Xx5QgJlyTM5neXCVyde1V/s5w9Vo8GpkJPh1j
         KeyBAS7qKXLjNTOx1HIGbI7vt69F1DT+vBnAwg3jueF3VZKzs8p5CPTV9VTMCS/Kf2Oh
         LVdg==
X-Forwarded-Encrypted: i=1; AHgh+RpxNkItAZjiosCfx0FS/gSmStS+4bbqcxasqTcbMjij11BvGqVYFjm+Uwaq3/PMSHCvlEEZj7WW2wQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mQsU3Izdu8lMM8V43VmST0aLsbwTKeAUUvovx9a70oKTqsmnt8
	C8F24Ddi0NJamJWkrCIMUtACbeP2a6ULZIhTewDQjztbXgzuXmsuvgLgGTOxmTPerdTTp9BXAZA
	DWewia2BBfmtSY49kzH+/QqfdGgeqafc=
X-Gm-Gg: AR+sD11LW9FGMlF6Oe1/w+cCRgKEBNBMnTuPpO/AREBeGjSc/G2rCXzpLBCFl50bRCJ
	nuz+8Ly/gzdIoAgY3LgxO6p1F/xNKU5cMrW+N6+thwrRbvoAg6U9qve3gDFg+Bm5JJOL8XbCikE
	w2hT9ZSqGB2sSvYsI/3Hj/6hHDBx9IOCMRJ95o4YNe4kBsaSq2mivxykSEUgvPkgBAmg6408R8l
	XC7MDq6SzA2vJk4JgFoVKrpLX8iOPFxdRL/L3+4ZZXsQJm3DFl6qt+hfbbVZvOqVqSs0XOE5ntf
	mwHG8gc10u7s/Bka/sBFzoiPV2fHLHEwUZ5r7PW0MUTG1siU5NvHh49+FKeIdHwPMedkjnStfD7
	6rskJiHkY1I9OWN4xgH8LRPfjta6+
X-Received: by 2002:a05:6512:3d1c:b0:5b0:1f1b:854 with SMTP id
 2adb3069b0e04-5b4841cbffamr617235e87.1.1787296549989; Fri, 21 Aug 2026
 00:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819145808.291567-1-chenyou910331@gmail.com>
 <20260819145808.291567-4-chenyou910331@gmail.com> <178720101976.15514.17524044147551392316.b4-review@b4>
In-Reply-To: <178720101976.15514.17524044147551392316.b4-review@b4>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 21 Aug 2026 15:15:38 +0800
X-Gm-Features: AcwNN1WygLEtJfl2ZzgtkqBYn-P54jw_4g3pTfT_k1St1vsVgDRe7zqwQw8XZ5Y
Message-ID: <CAKspUhJJS+9SNBV9gEicqM75Nh3ChtsBt1usYJLca+nhEmnNWw@mail.gmail.com>
Subject: Re: [PATCH 3/7] docs/zh_TW: arch: remove maintainer contact information
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> So like what I said in other patches, many of the translations in this
> subdirectory are outdated and lack sufficient coverage. So I remain
> neutral on this change.

Understood, and Jon raised the same point. I have replied there: my
preference is to keep this series mechanical and open the "what to do
with stale translations" question separately, but I am happy to hold if
the maintainers would rather settle that first.

Chen-Yu
