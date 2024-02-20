Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647205A7A0
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708432137; cv=none; b=Tit5sohMf4aUuPjZ1jjWx5fjC2GUsuH7jeNPd7TbHuZ+ksAwxmhYW7PFwFNMb7Hq7wrzk2RaObpWcoEd2mHtXaUNP0eS1wpgzPodwgbMRk/fEi2NOyd8q7AgylGs2l2RY2XOiWwp+vfsUi5GxZN4I1xV9lyzHI6fNpJVTaGoPJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708432137; c=relaxed/simple;
	bh=Lqd4WYUnccIBIqbzl7+NkpSoALyemojxRPYdhyqxBFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=si2W90nJNIphDFyKaFursFdKbTBn1QiMcbo/CdQGerL1oE4FALIxwajjApY0tJyh8uAHvYzSg0tA2zimrcTgyhgDVuWcuJo37xkqAYMyqqkt0B47w592ERgVpk4yW8cQrYkyJOpj37vrf0WbDO2CSq07IEIOC1S2nJqJtX/lcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=lwMcGTpm; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="lwMcGTpm"
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 560E73F125
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1708432134;
	bh=Lqd4WYUnccIBIqbzl7+NkpSoALyemojxRPYdhyqxBFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=lwMcGTpmZefP9hlv8nzN/op01oN8AmR3LbENt7vhhI82aLOrLACKTb63Sr4XJ0t6g
	 dhUrb1KTX5ZvedUP8gYEvGBdr7GR5gsfEqwYimjq/UdfJColzb3CKzezjclqPYCtUz
	 gP5nNSE032HjScY2XP86CSG/lNm/7rMmxp2iDa6BuStxac+LJ3wd4JQkZodE5anj0m
	 cxmbtu843Zbbs5wGOg4LCSbverZ/W5Mr9PXQnbfdjwO2AcqC43TjqIiRTBbAZ8KQF6
	 gWJ2BfBzsddwn+rFP2EHDIOwsvHPpwinl6oWmVmiPI2maPaaOOrwQTPZBUtrSeXsun
	 iTPTbsHTh59VQ==
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5cf555b2a53so4823508a12.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 04:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708432133; x=1709036933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lqd4WYUnccIBIqbzl7+NkpSoALyemojxRPYdhyqxBFk=;
        b=hfyCOkDR38vP5lZQNbZ9NM2z21p+UEWE7+ggDedUw7YE7emfWTNT3u48rrf1OLOB9U
         lIQ0qpYCzf04hdgbl1DqHJJx76svKuUIY4JuOTsk+5/TWPCzjfMM8+p/mN2hZA6vdOb+
         eV2VoBIBYBX/NGtK0W39JrQOuxZf4M+vAJXXrD3nJE5Hf/bdJsSI6Uzayl8kcEC5aTJC
         oiiTWdxJ4KZIxWj7hxykTts15I59ON6Ia1KcXl0RvnFy1ukYHqsm8ovJOy2lx9m8uNnU
         0UQJb3A4/WMEDXv0fCQ8Z02uLe9l1s8Sh7nYY4UUeMxAACxyb+cRKOjqqvKAwxk7L2dl
         Z3/g==
X-Forwarded-Encrypted: i=1; AJvYcCU+l9fILALrt5RvLlYNsXl/7Mx+y27RZx2N+DDbydwl1uiLKvBqku+h82VrI43njZFXROkLGP1E3/DlUzGWxnRgLfuYEOwlO00I
X-Gm-Message-State: AOJu0Yw+W0lJjmE8HEWau0X4PqoXQD2R/6yF7eVRGrPmQgQ2vZ2Fbs9q
	s5nKP99KmLWzSSg5Y+ZGlraCnyUmgrTGAGkD39OgXaklWggBtnwER7YEFHoCwcO4a8mLy7CjiH5
	Ym0WgE/CXXzvpO9zDTjHpnk357N7L7qd5OfXvvd6spT1NDyQNqnEuAlmKIqnTUFZvsft1C/tgtA
	==
X-Received: by 2002:a05:6a21:3a85:b0:19e:a9c2:e0cb with SMTP id zv5-20020a056a213a8500b0019ea9c2e0cbmr22090877pzb.25.1708432132997;
        Tue, 20 Feb 2024 04:28:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE97B84Uq2UpG+abN/I+MwlHDTBfcdhI2z2qjsMLJLhpJVYV244lzq4DKO4QzS2xoZVv0hL4w==
X-Received: by 2002:a05:6a21:3a85:b0:19e:a9c2:e0cb with SMTP id zv5-20020a056a213a8500b0019ea9c2e0cbmr22090858pzb.25.1708432132712;
        Tue, 20 Feb 2024 04:28:52 -0800 (PST)
Received: from fenrir.. ([179.108.23.66])
        by smtp.gmail.com with ESMTPSA id u20-20020a056a00099400b006e47300e4edsm2456787pfg.183.2024.02.20.04.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 04:28:52 -0800 (PST)
From: Lincoln Wallace <lincoln.wallace@canonical.com>
To: brgl@bgdev.pl
Cc: corbet@lwn.net,
	lincoln.wallace@canonical.com,
	linus.walleij@linaro.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: gpio: Add a note on the deprecated GPIO Testing Driver
Date: Tue, 20 Feb 2024 09:28:48 -0300
Message-Id: <20240220122848.17864-1-lincoln.wallace@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <CAMRc=MdoUuOLTYHu99+c_AVhnDZ5LkKHkYJ0D681fcJV_aW2Ng@mail.gmail.com>
References: <CAMRc=MdoUuOLTYHu99+c_AVhnDZ5LkKHkYJ0D681fcJV_aW2Ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry, please ignore my last reply.

But okay, thank you for letting me know, and thanks for your time.

Lincoln

