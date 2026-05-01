Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B29A255F2D
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650753; cv=pass; b=glNCqGopiV4ZsPrpBbQf07QlHKzrbPNsVWw7YftNPSsTBY4HCkNs4ahl0Pi1qIqwdRJm/2/TJLDYEV5c88U3ED7CRDHCjjH3EQdOQbUuxJAmG/tFKP6LGd8U1xN8kSEbmnvAhg3kUcu/iUGq0/bZtdfkhW87/zyINjfJ+A6n2oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650753; c=relaxed/simple;
	bh=nQ8nI6yv+LM/xv541JFta6ax/B38uS/0oIQQyNP9n4E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=My4MQp/wXoV4OpiKkGyWBEOv6bsWFVie+nQIlDlLK4E+edqbXabBjeB2Po+94hbqJNSTn+9Xqjg7KMSU0Z+py35NWgy9ewPoB2kLpE8OnX6PEs4YhaHrL7k/pXvxgtbXrIJpjYu+nlEBZvzWvXu1GEHsA37jcyGiN207cSr7CUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDNpSoPw; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDNpSoPw"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-67e0d3f288aso1208371eaf.0
        for <linux-doc@vger.kernel.org>; Fri, 01 May 2026 08:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777650751; cv=none;
        d=google.com; s=arc-20240605;
        b=U+Am18aEYRekqeffFb2VD5ZIQexY6IlfdVYdxyGfajdEv6ElDN5E5H+P4mS1h6Mcoc
         fd8PfofT6Panqi44DS3DkRSyDD/MFMHsYq0QHhXg7PFUTxgU9CXzFN7kleXZNoYr9Ds8
         6wXNRFMxuzKDKjMUM+Sq3nYJ0CSLuVs8Np0jI05ANSbHkVLUGyUM6qBB5qAVd1MKU5MY
         FoRpabvNb1dKFp6q/GOv3k8FhU3SP+RSbwrOzWMAVuF0fh1DsmtvmSNBnsxTY/8OGoz7
         5V/32xPivt/iCMcQgIPdjHAqbjA/pLvhE5rCjX1hxuxONFuaSyRl5kbMtvWGbFi+bFJA
         UFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nQ8nI6yv+LM/xv541JFta6ax/B38uS/0oIQQyNP9n4E=;
        fh=ZbonjbzJJsFV/lWPP+WlMJ1nkxs7eEVT2jwfomzjfAY=;
        b=FGM2bUQ35MMPbchLrljb09qUOxwVfnbl64fNuFMMez5Mg9qIoNoclCErjIgwh2pTr2
         eMXuQ+7p9IcsO946Fl6UjsEmQ+6JoP1HAdsmme3jJXx473tZwcCRfCN/XfShY+WF4Q45
         tVCP7AschKbLe1HwoEvf0lDRibEQIUODDDdDkTybM3KhsHFaoxN+dXuLvltv6mCU3zC/
         XOJj++q7xTDvhk2sXp4NfyX0Ey8hny+t05uQbQ3rY/wQORbz0TTfV9FyiNIhs0TjGE0+
         VVk+pILuQNt/JMUu8+YyxIGz6SvJDpstyIb37MOeNzFpb5GI2th+g/EngNKI8R1iV2ci
         GsLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777650751; x=1778255551; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nQ8nI6yv+LM/xv541JFta6ax/B38uS/0oIQQyNP9n4E=;
        b=dDNpSoPwxd2wpP+CX1oiOvbUqb7/WRSeANBi6yYKCuJxk5Sg30YxkhbH72pLD4JwmP
         VtzG0yA6KsQaDMXr8K1wc7hoQWFWPTr434AjcUELsKD1zxHyX2i0RaJ/25b6PQbBtC7a
         IbUlsiKUfl69VdEXrJ5BZgAS+i00Rr0E6LjoYLK0VsAxHG6JpcQrHkgfRalEPnQpkrZ3
         QDt1o9EVtGS8rY/Rll14y7gtSGTtdvbR/Lt2I90NiiKlfmNharXS+0hGHc8xG6s/rdQv
         CutePT4Ux0gWvcSxbM4vECckVwbyrL3IL5yIk+agN+CPNDy3IRTlhbGdiHFMNChy/dOy
         jN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650751; x=1778255551;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ8nI6yv+LM/xv541JFta6ax/B38uS/0oIQQyNP9n4E=;
        b=k/cW8W3lxXO6SQ1HGGat/eKnvMqx9rry4g3oqfj0ijZJHggmX9aZvxYxiTIDxYcw9T
         rE22VC6Z8dPwNlCHiMygwsN8rGMdUGIUmUXs7BM588zn5NQZmTxEA+iw07P3HsAcIkXB
         fWpQuSrOqiqJR7e1CZ0wl3e2R9LjNInUvf+LaURJY0e9g4Hh7He7x4pRyyWQ/XmnRhhU
         Es6LZTlTi7VvilOllmC7F4fHGUgZpi/0lc7eI0+K6ZOCKSlVHSRLJwFfu7JfD3eULODO
         jyvyGET5tg7otwf7rnNFkjXXl9kqXTL+GuVMmQVHJA1XJmCPCfngTPeUQ1BiCcFLz2PA
         KNbA==
X-Gm-Message-State: AOJu0Yyn3DQ2FT8kuSXFlo+ZKqgoYgWj+EcqOTVlfegDln1ofbw0ySdo
	/HWuZeLoiUBmH42Uk8m5373B+6YTe61Dv0H/ulUisVcQ7SZEI6djz8JyOy457GB+ArtiGAlfzP0
	eTQbkodKvndUdOLmJUlzH1vXh+RYBja3HrGMV
X-Gm-Gg: AeBDiesy+vV5EcyVZpa6lSxzffS36o3YgfKwCy3y/xymlXKhGtHANMBon7iDfq6gGYH
	1xLA8qYKOpWPW+jNP0s0MG+m01Ooalt+HwGXrGNsSHqqfvThRGFonGIeCtDS8NrE3jJ+Uld36hl
	y203N27NfpfEp6sWrbizMNdpmT+jmQ2Vxz++wD1jKv7AJRSHmVAtvz+tI+yzvTgzwUs/rle3juV
	323E6y47H0X979Nh1CUZw4htrpox9kDvXr5DePriaot3kmEwEK9vMxuOBpoRZ5KK7CvGtvOkBdf
	iRmtfSV0kkR47bLWqTJzObXrfJRysNxc52KVl68akL62w+mANK1cHkc/r77G3u8irGdwkWFjRAv
	1fJb0LGgDY247DErlrZ0=
X-Received: by 2002:a05:6820:f026:b0:694:92fe:54f1 with SMTP id
 006d021491bc7-6967a668c28mr3909910eaf.54.1777650751100; Fri, 01 May 2026
 08:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Fri, 1 May 2026 12:52:20 -0300
X-Gm-Features: AVHnY4KpgdAJZWhw2E3AhYdWeru1_NpWWuxc5CrRtl1Ndu_JFssG2WhC6bV_rTE
Message-ID: <CAMAsx6ffhf6SsQiatsFRTztpc=9xedf8hexxDKJ5M4JYAVxq0g@mail.gmail.com>
Subject: PGP Web of Trust and identity verification for the pt_BR
 Documentation Maintainer
To: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I am Daniel, the current maintainer for the Portuguese (Brazilian)
translations of the Linux kernel documentation, as officially listed
in the MAINTAINERS file.

I am reaching out to begin the process of establishing my PGP Web of
Trust. My goal is to eventually apply for a @kernel.org alias to
further professionalize my workflow and contributions.

Beyond my maintenance work, I frequently deliver lectures and organize
mentorship programs focused on the Linux Kernel in Brazil. Having an
official @kernel.org identity is crucial for these activities, as it
provides the necessary credibility when representing the community and
encouraging new Brazilian developers to contribute to the mainline.

Since I am based in South America and physical key-signing
opportunities are limited, I would like to ask if any maintainers from
the documentation subsystem would be open to a remote identity
verification (e.g., via video call) or if there are other recommended
procedures for maintainers in my region.

Once someone is available to help with the verification, I will
provide my PGP fingerprint and key server details.

Recent activity reference:
https://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git/log/?h=docs-next&qt=grep&q=Daniel+Pereira

Thank you for your time and for all the support regarding the pt_BR
documentation branch.

Best regards,

Daniel Pereira Maintainer: PORTUGUESE (BRAZILIAN) TRANSLATION
