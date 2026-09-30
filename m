Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588A94E73D8
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 12:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772587; cv=pass; b=ChIcFKq6DhfvmeV/k+ehwcT7FAJIl8L7UeMuHrkKCQYLE1fIVCqza3uF3YxXZNa53Vw2Xtjnm6U1PNvj4Qm+DswIl6YqHXp9zMh2Z1659Nped5FcjNR+N78uVkEyEmsllWG1xKOC/PeRLNgnbcsRlhHNorWQL6KWykuLWtSNocQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772587; c=relaxed/simple;
	bh=LxQMPKPB1CLsMs7Ihhrr/WMxkOEFkoDzJ24jltZgFeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9MEyE+t3NUi+i6xIcW7JPGMOVTxh6XJ1i6RGIhhHJFKna7dgkQ75mRlYbnrBy192F7Xz7u26K81fPN38hXpBHMdxM53PUhRysS9iu6mifiSo9pd7dR1n23HEHdGZ49QBIG/C3SjJwS9G8GXXLKBG1OvTyUtU1EoS6gKyZfBS0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVLIWps/; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVLIWps/"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3acb3d0dso112373e87.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 05:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790772576; cv=none;
        d=google.com; s=arc-20260327;
        b=ngn2ATyoKID/ehL66XxjF9fxbZrpuXJUhXjW32fMiyQAIJut9AToGc4vKXhcIvdHWx
         e/YAugOeun12AKO6Px8UwBbGDoc9X+nlh3yNF61IJiFOr4xZoFDSg02B0yIuUm7Y/jMI
         heVLvL5/pqW/pjBDiT6u6sYtteMgzWBNNmJONrsTXavbP7X396/W0ofeG3LrIFffzgr7
         Z7WV+9fv72iKoNoKKWcjZXafktKayMoScmA9aF7sWJw4Mu/ovBDoWEIKuJ42MTdYvcSy
         Yo3+KqAhzD3AFcCOzNjZArzY7OUC904uxhz8Urrqw053sMBwVQY35rjA1ECZNmkTnQb2
         q1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LxQMPKPB1CLsMs7Ihhrr/WMxkOEFkoDzJ24jltZgFeY=;
        fh=OQcfOyYFR2Hx3Af0TAECXIhRuHtnL/O02Z6hshChGXc=;
        b=Ngk3ijxICOc/c78ekt3+MxcKajOflayuq4UuO4QpzdjsPfaJDZsKEBpVy+DpV4Ij6w
         U/ylRsaQzrhKHtM0tu9Mr21Sdn8G4g+Lc4Bs0hovYvxxKAdp4MuV3ip1bHfFB+76ioXp
         MXVrplIx+syOSXU8SSsubKO/x22BHiOIRdimJ4XumxZaGLxhK/2tpyK0fG56CVq0n3YO
         UkGkKiJcaZ7wT4dfwdVNzRf8t2BBz28BpXYehQPgZi/gAKWsmcp3ENhjkMYNZgdCgq+S
         GzfgIlrxY1AwLdem83Ezvhf2hbNLFovLDvZZC+e7D1msNVwZaeG0MduyTKdzFW643Rga
         UzEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790772576; x=1791377376; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxQMPKPB1CLsMs7Ihhrr/WMxkOEFkoDzJ24jltZgFeY=;
        b=bVLIWps//KcFCIeElGupaj5xfoBq2LTL9IXt26uLAiNuPIinhvgjQFZFSykZxa4Sg4
         Whl51hwKspnA/M0282g2WvQxvRGZxRe9FXBnTaRaEv8L2NVwBGwwJe7CQuQxpVmnvdxM
         crH7riHMl012R9xETyigW+dcAVUoMm+trgjRpquMJGHC2CTTSTbNWVXon3apA+UEi/4P
         EWbG4IB9jRJAykz4Os7pwPhRT3gLF7CDBVAmHlMUXvhxqR85Anu/E7ecfRrtor63Rqaw
         n4oU7kLReGH0Jg9Ux3gITzbJ/J5DEYQH/Kein9LugNsRZsITU1HLVUV8MA7MtW+0iMcN
         Bj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772576; x=1791377376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LxQMPKPB1CLsMs7Ihhrr/WMxkOEFkoDzJ24jltZgFeY=;
        b=Gl2hAHn2+L2+6K0wwxf4LvEzz2U7ctqEDynduX43iAw0WjUeqJWQGgcK11LQiBqf4I
         4N3kstK5wDHihzgf9Bv97KHwQ0cNVmefWBttPY19r/rR+gjL5JX21fbREmeZkiB+oKjk
         Klv1GaHEsdModK6tScnzIo0qA4+2wbg5+a2aOhBCCqtP+NUgJOTWLK6U/yo/knsBuKtf
         EUgHSbJMEPCAan2sUY5KQfxJFpAO5gNxnkYmRZi5fMnkL91T940Ryqf8zuMAz4XKJekQ
         2MxuZu+CzkZL7v/00OL1DaoaKGI2AOEzjTIA4INzC6IDYvVGHx0jvOgIn1boGPhoDOMP
         nsaA==
X-Forwarded-Encrypted: i=1; AKwUvBxxSKUd3xbTXWx8rSnaAqpQ5ERbBRwnWHmR+tHBrQpiItSROcfm/BBQ/sL5tNI1P2iPhmiJnpjWrJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLedqeihcok5ggXVJ548yasBrSSEbZN5gilDUbgx6p+LbeBjivH
	6X8ZrZjFz31CEn+MW2r0oL4zxIbr7XdgxYjHulqDFOXDxO982gbYVlqTzMGBVvJuJXyuEwt4rKs
	X4nc6XCaLDSOo6cHwmv8W/ai52udSoVmackOP
X-Gm-Gg: AYBFou3BzfdX7DU7f3PkcjTtTVY0jxHUnA/oP0YwHclCdJGIRX4uceTVVKNnjpj3F2K
	a5js87TmEK2x0OYJEcnygcUL9ku/5KFtztbizx4h5m/w3v0wlCzVy1JgE/50bSerbZn243sYvJC
	pR7Wp3QiJOKpSkvIHUX7kElXYyulIhuWfwliRg/5nHHRWfQA6INSXxlLmwcVD7HC5dsooWIevRF
	49ixCDBeFb5MyBIBGcrHSs13RNs8d1b7wCoO8eqLiPIXr6ZFc/VSDBvk5F5sGDwtQYkllmUdXRM
	MHJSyKSrKrWl2O3n/HDzpIdYb3P8U8nWGNFwpFgSt/qEJZXYbdqYPS9mjoEyvREbhopO9vOpeop
	zPgMO/W11Iub1dQKFF3/0WBPZL0FZhpggtqj1Tjy/MPOmG489RNZlfq7herRr3QjOZa6V
X-Received: by 2002:a05:6512:3b8c:b0:5b8:f271:2663 with SMTP id
 2adb3069b0e04-5ba4027b025mr588514e87.0.1790772575773; Wed, 30 Sep 2026
 05:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-5-chenyou910331@gmail.com> <c719c6756f345c6c39db483654578ef09de1948f@intel.com>
In-Reply-To: <c719c6756f345c6c39db483654578ef09de1948f@intel.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Wed, 30 Sep 2026 20:49:23 +0800
X-Gm-Features: AclHuK-D7zf73Knh_TxmzrGJ4myJh2q-dTjIoLvdAmBeYKhsQvqC75aL9WGox60
Message-ID: <CAKspUhKCpXGKb7zpz9MbtpixVMUWKXMJtK-z6CcrezGA6e+ETA@mail.gmail.com>
Subject: Re: [PATCH 4/4] docs/zh_TW: add missing :Original: fields
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, wy@wyuan.org, 
	si.yanteng@linux.dev, srcres258@furdevs.cn, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Content-Type: text/plain; charset="UTF-8"

You are right, and I should have seen it -- the rest of this series is
built on that same expectation. checktransupdate.py also finds the
original purely from the path, which is why 1/4-3/4 move the files
rather than fix their :Original: fields. By the same token, at their old
paths the language switcher cannot pair them with their originals
either, which is a better argument for the moves than the one I gave.

Thanks,
Chen-Yu
