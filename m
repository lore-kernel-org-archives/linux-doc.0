Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978208;
	b=xvSomKhjSnRzstmfChGSfpTn51buaEcf+PCNCjuFln6SmXOzq2klvQRTlhVHKmDefBpN
	 u7GRsKj/seFhkZ/btBL+AoHqfDKe+pUA6nPU0kS+YBknjnBtAFUNrXi6HqFrQdkubrcIq
	 5MHRGT2D/lDw3xddz/DBaTR9+/czhm4YO9mj/qaI9evQ7exGxlGR/zmty37/VKQrQq6QH
	 knqbUgJjCwHXrp/gnIi69xzo3lyKnmhsRB09zGrBMRJ314tlz1bJ+ovjgrUnx6cofRg3W
	 6AhEXqgSo/Tq2XbNeT2NQlI9oapIHFKxeLCIpVLQFq4tOd4Pyzh6VVtrNCS1mUk9Acg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
	b=OcFAVCtQRGDx7UYgKkj6wOt6h5V53VX1K4M0S6ED9fSYSBOShCDVjgIZsyr64mBuf2tP
	 3MO4mM96WHBBdqMOa6Gbg97p2um0TVFjdEXzyUVv7k4ud2wtJtSyhSfds72pUpMsS3L0g
	 XJI/jr5Q3L4F36sUIgM1cWSI0oAdjptsht+oaw8c695fUk3xEU/iJyH4mqXshyqYR7bX0
	 4fuhrM+2y5VH7NQY+zS2U01Ah4RJ4wfnIxmrkDG8bGl+ypiAvrF+ATosTlDYsCPaHTJrm
	 P5F4KkRUu+8fzFY58MS40Dwf39MWr7kpIve0hIQIRGbe8eyuX6ufPxiF20qJxfuADgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=db06y5rc;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1178606A320
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 01:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1178606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=db06y5rc
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-536717a4d83so21503741cf.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 18:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792978207; x=1793583007; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
        b=db06y5rc/a42Q7I6gZJqHn+6RdhZMkCe/PM9bPSIkdzdKIQhT6awBXpLvTCqXMFoas
         vpdrgYSILQX6pa54FHjgkevhT0qw3vOv7aSYEbQ9kISBjZHIWOApblEsWdkQmN6fLDCk
         W24B5RsU3rGvAf0IivQNlEx9/t6cNsuLl8yuZxDFKTzIMJoEtBNayYZmAA82jEd8Qd07
         WLcOpzJBZ1ttIyv9gx4mwMIdcqToXkb+C1ma90FuzfTAC2kL+RjBEThxU4bAZuzQSInS
         TiQlkuu+Cs+eQO0ocaFK76BeQh/XfL0G6SA9Seh5Cl/7aXXbcPfIvztM8BV9n58h/Na5
         xQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792978207; x=1793583007;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
        b=N6ewwx4/+9yEwVIRPLTKLo7155hLRKgQUI/tve39DP8euxCPMUmZo4x/DPIcXeB7Az
         qB/lGmFbuqw5rYjvXn2Ad4Fi1h9dTVX5G+3vN5lRJnJe8RlYd1brozGmTTyUA9xZMtrP
         bevmN09u055/RpHbVpWkOlXqCSSFoYrKSZ7NdURmPqZNP/IappuTSyt+wdCIGvIONtqQ
         PujRasuOnvLz+ep6S0iq3AxJrQZF2d5gLylupRNJKj9RJcMuT2DlXoD08tm4dYNbO0nV
         +AqxTiphTV+4cCZSetQ1CYk2qd9zDtN2dE2YokckZFxZaZQ/jaNG/6H8Tt9oRjdQ22X5
         UuuA==
X-Forwarded-Encrypted: i=1; AKwUvBwU2Gv2emLWSCZzZA0XRnjAImqymY/r4IKh9FWEeRsK6UPVgmz9KOcjxft61s0xyDeFhYpucWRLn5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/8iq010y1RhOIi5LMMA1ki3o9hKQCmBrtAOVHEdM0ZZeyltIY
	mB/kmX5ivCIg7qNJBWb4OKsoG+THoyuwY7OEwuIrGRBqiXlVWFmjd80=
X-Gm-Gg: AYBFou2LXrc6C/Zk7oO2Xl1P+IGFupK24zczJPfpXufEEHBDx36zzP20XyMJlXnXXri
	aie7VFAOB2PKhXghdHVu3UrjWVieqLQuvOT0sSuaLhrZ144rC7pkn7do50gvayV9PSsnTMcMhX5
	TTh3LHXuX4pbTsM69RA/yaTUAPsbtt7HrNucglqrM7530LBDCpdfgjxG9e7kofrX1W1Jwh5+JRC
	dL/PBjPWctCdN+7ZwFtyPA7zK11EreAZCQ0pmb1CwF0ZEoXG4RGPI5cd3/b48I+AfY6vx5DOSlM
	oQfidh83xmcD97f1OgaegUjkpsM8cCkVhtr2Q8TVhdPQvWDVcp7CyLFqBQX9feb0DKxb39lvTrd
	o/4hpqNctJL91pVAHWIQQmVxuv3EwFl2t96aJDszTcg/L1A+i0Hmn6HPPW63ahA+L4uVQ93rQnz
	nIhCf/8vX8oCfEK/teJ7v5eJuPdrPXpXvkxMlIKxDUPXpKr7cxT33RC7eThUqoJ0WChzjM+aRL6
	wW4G17MSlTQg6g/wIv2TjJv6CezOdy63iMB3HGUGN94FOoNjcYW/mLxzUSUhjtSF8bQRm0o+ofD
	CD3eneWEgR8JFUolKI9tGtDEUCanP7MqwEV6c1c1p7uRSQz2okiCHUq3skcvjVGGHYvM/1NapMo
	Vn6Ci0ET8mZKtIfRcCwkInU0dU+S6QpbVTW17Mltm+A==
X-Received: by 2002:a05:622a:5c6:b0:536:5c86:cfd8 with SMTP id d75a77b69052e-5383b5e681amr81425591cf.12.1792978206784;
        Sun, 25 Oct 2026 18:30:06 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970a2basm44270051cf.18.2026.10.25.18.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:30:03 -0700 (PDT)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: danielmaraboo@gmail.com
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kunit: document --summary and --failed options
In-Reply-To: <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com> <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
Date: Mon, 26 Oct 2026 01:30:03 -0000
Message-ID: <179297820301.2598507.8486986636667612321@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Daniel,

Thanks for checking the entries against kunit.py and kunit_parser.py.

On the indentation: the continuation lines in the patch as sent use two
spaces, matching the --json and --junit items (see the raw message on
lore). It may have lost a space on the way to your tree, but please let
me know if you still see the warnings with the original.

On Assisted-by: thanks, I had missed that docs-next dropped it. v2
follows in reply, with the tool use described in the changelog instead.

Thanks,
Eugenio (Jay)
