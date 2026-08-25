Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6508D37CD47
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683203; cv=pass; b=K1ba8p20GhiR3cr59CPZ8VQx8I3f43Khg08nDR49rlOvZtMKgpnjwZY6HyvxyHRg53jWuCkrPU2rCq0V5YMBofCHotQV40H3yuD2befl4dhmtuKCkM9QAxgWHjTzB0bxP46vykcHDitNyxsloljE3bkepXQrTG7cAKfXhXGKOSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683203; c=relaxed/simple;
	bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJRNvw1ta0SMid9Ow5nkcpcbodb7ySyCwVJDmvVMTMgUi3mR77r+3gPpKlSX+QYGEBENvCkoJL1GnuvTsgiuUL/Uej9p1vA++XodNBRnb774ZYPQeX6Spm5RkeQaKNgFR2u9LV+Ybf08cDPYqLpL35RUxwCxJ26fKZmLnuBskeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/WMQGl2; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/WMQGl2"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-45eb2e6402aso166183fac.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 11:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787683200; cv=none;
        d=google.com; s=arc-20260327;
        b=ePlAdvL81r7vgf5f098HXQgJ3uu9M/1wV/zvAFC3tKKqSNasIVzSLB1sk6KRZxKeQ7
         AqXkKhlLiSJygv5r4q5AHRn6/uSD+Mt6uIevkVlfXsNU0aNhMo/td6kF+Z3lqkqA8bT4
         awp+GapBVfEAsxuVtbwmyZhP6xP3aMhDYDwL1n1XstmYi+KYhpFHEbhHjLvHx3JNI48G
         MPbo2Kmcj2Ke54qyr4KHf/MBSU6MKTdqA6YBxCcpNU5yRhsCmK7pK9EGr4xaepasxR4n
         JQXP5vFz3JJO3XI6yqhGvmO+04MdLv852w0J8ljkXvMJqMTWG80iQzLpCTFsuUWOEd6+
         041w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        fh=Lj9gFzA8zTqzT+AIOxkzKAqt5PWzLKSNejW8e52mIhw=;
        b=PIojEK/x+7SS/kb1xygdaivTrvSB+icsAVuVPQuYAN7HYoCpAk+G6BkwY2errgzRnb
         T5slNBrwC4w8gct54a5wxRSoHzTR1RHVCIifxlsWTIBtIP1S/8ATyLoWP0H/ZiI2TJHx
         SYiMqgNtfdJjPKnYLknvsdJush7Xe1Vk331b024jNB7g/g6V747g0Pm13QSLxkFKEudE
         5KN8zyzhvosxLmR8DHLSICWuF+RW01STKb5hmaOetwl6F2U0gmn5Uk1O2wDakRhsDHdY
         PtBXMl9bUOqn35wW5MUUXRyqbwYsOnKKEA9xpjGJvK/h4xfbRgzAI06oQlveB98PzSBf
         f7eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787683200; x=1788288000; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=K/WMQGl2ZdGLQuaSQqD9iQu02BHFLpl/p3H3OZdZxR/bBDGQp5KNu2iVpg36hNlfhg
         WoQEFDr8krOgQIpMU0V3j280JREazubY2O2YsEF6z+07m5w9CIaqAAjBnkdEYRlQu+y+
         pD/XRWpuHfeGLjDfmy9Ig9pH50RXIICyAOcdw9XFFVtDZZriIcDMJqBqzBEo78Yg+k9E
         MhhuGygE6O/X7SL+/HsL9VQ6F6OsRGK/97YA9rz8erSo/DNvgtudBgbpEEnZlI/8GUMX
         21CmXKNzOwECkSY1y9d0pN1/DCKPfXzELHF+QyZeBKWFEePIAzj6Y9UzjhBWJQkC+VKU
         eAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683200; x=1788288000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=eJG63y8L9LDhpAqPwJzPrVzjVlzhc3cz06zoPrI6/o/NFIP3fHHtO/jSRKDVdh131u
         OgCeUNladil59hmtATRVwRd1IwIxYx1xH8FPK2qdvU/j/l6rE/OtIqQNqBBjJG038X7I
         FYZWoC+jcyQFyFY8as3W69F9VHbsqjHu+w0y5GXTPULYFIFK5GFg9ToAEm0cJHs/Vn+4
         Ee+seXK0n3bpji3cE/dFD61idqOyM1zYWaG97eAhM/cYW3RgujDKOznxJMuqeVrhkMeh
         gmmLP4yIjM/a5+I+wCF+pFhBeRvrtfbthfEbuszcOny+F2wY4omwYnNnABszX62IL16i
         7G3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrhjLOu70fu2qvoDzweS+YWonzKC8LwUQY5aE9rjEKe9RFhKiRn/dXs5VNGs0+BBHkaNGj7NRFrB5A=@vger.kernel.org
X-Gm-Message-State: AFuF++k8WDepjPxOj0TENOn+1Xal1SsByhenGkjYtWoG4sq7NGKbY9FL
	6y72R7NZcQYXOiC/bJUMHNe0Ey9mdH7wZJPNBJI8TubDb6c/cBv/+0kQN7o/UidWzcv2NV3RL9q
	YXERysej1zvBkSJwwHXC/m1PluJK21pg=
X-Gm-Gg: AR+sD11taFl6bh/jheEVlm4fUuitg3hZjzDe1toMnVF5kl3xwibaJ5VlhDoPkRUx4w5
	mSgKScDaEX89wliXXIQZC9HeQT+sn4jssrTSlwaGTzb1Vp9dQzy8VmOH+/AHBCa8FqoRwesleb3
	AooD2fMxqb2ToV9m7jFiu6z35vMlgmyoDbeXT6wmZwlbO2yuRZrj6hMZIDvdYzPqQsYk0DQ9kHB
	/6+fOfblTPZJZeznXj2sRjUFUirZC7kofvMSuD68+13E/Cv2AwPCI+Z2wBl1hXC3S97fvlb8c0B
	jyz9AYIoDJxGa2qnc1KVWPunaKHt99vfgZJkdbLrSJ4dJQ==
X-Received: by 2002:a05:6870:f623:b0:435:16e9:f288 with SMTP id
 586e51a60fabf-4659bb24b93mr1602806fac.20.1787683200126; Tue, 25 Aug 2026
 11:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
In-Reply-To: <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 25 Aug 2026 20:39:49 +0200
X-Gm-Features: AcwNN1Va3aTr02pKhzBqoinFUkwxjfSbh2WQ-EpZwUvKwCIdS5rdnwq9NOj-ZWw
Message-ID: <CAJpoHp56yo+eQAYjvR3ez=HTSzapCd3dYppo=MdPx-Lm4J4DQg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] drm/drm_simple: remove drm_simple_encoder_init
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey,

> Diogo, do you want to send out another revision? Otherwise it's time to
> get these patches merged.

I would keep them as is, unless you see anything that should really be
improved before merging.

Best regards,
Diogo
