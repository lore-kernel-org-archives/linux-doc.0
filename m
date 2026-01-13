Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2352C389DE6
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768310575; cv=none; b=r2DewhB1X5BpmNo4V0V7UDwu/ELc342wjpESCIB65xPMBjTHUbVBFGHzFuHpQNzle+QH2Gg+KjREQhz/soZCBy2j4Z91wZHCGgO0GG5N49oNdxK4UscOY0M2Ru5c9WEVmgNxGr1s3kXL2UXMPNqygEz3VG3oFD5wUMNzDvcMv7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768310575; c=relaxed/simple;
	bh=9Mgbd6hLYyZUvA5ylRuwiz+22RngeE/5EJiRoxjavak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M3vTzz2wC33S2DFUqcoIij14RCsUAceEo3+5yONt79+doeEdXffh6wvDTUrmL/1tgWpr9fvDSmM3HueCuySuY51sK25+M+tBbpYevUP/Uyrq131L1jsgt3cWPZWBLCZX/e4r08vx2Rv54qbCaO8F5rcCBjzE1TSN/BDk4iNrJ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXBBPzW5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXBBPzW5"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0833b5aeeso74763815ad.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 05:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768310572; x=1768915372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8f9VuSjE116pi7iG6Wpon5XwC0RbZghgrAlkmtN02HE=;
        b=jXBBPzW5Yf8IPx0L5ejxvjyIki75WjK0Gq31WyosO6nnSLTLydhS+oIsMZLQD9tRtA
         b62Ga5dS3I8874W36Y/zO6nX10XV71+80pPjAqXwlN2gqav23C7TeYe7Xl07SbMz+8KZ
         uSXxUKZbEBUZ0vcyEr0jSmxcBC6jMtcABtg3YUD76UP8ff54R9A5Uh1wEFJr1zGO9xj0
         xAmxtpqA8o6bH10+NEQwD0kyTvNwKwPCAKLQSRVXhAAkhnxQOdBTFZCOA+tQ3c7iLis/
         4zhR+k12lvlkfTNE2ji5obJ4C0zrQaWXeY7/JVULM9193+KlGEEB2Q9TmgmogaJKRTfz
         6KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768310572; x=1768915372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8f9VuSjE116pi7iG6Wpon5XwC0RbZghgrAlkmtN02HE=;
        b=AdQbOCw3oEvUxVV9kSHOgxBbwwbeXOrdYhHw6bjv0AXLtc2eJRZMaT8eS9BqioOPtg
         Cezui+iMYnKlI+2eBdTkFPetvqBEcJRsGcJMtpAf+6oQ5ymD20A7SmfqOejTN2WCWUzm
         4y6amHnngFQ0SP12tV+Uyu5MtNbDQo04uwAOCrJSvl7bZPkwxrf7P6rkYgCa8hsK34th
         Av5u5t7cH8FQqp6zxtbEfePHUBzOIF3GML9TE1JFXPjy7tG5yDKGKqv3WhONbYvi/Um1
         4KeOOu1YrnTaZ8RowxEG3wt1vMgW9w0RrCm+fgGT/fmNrMVwFKzc/G1aNWJjKp2cPL95
         AH+A==
X-Forwarded-Encrypted: i=1; AJvYcCVTwU019BmEq2jHKcDGzU9j1DLUuBPnM4XbbfE8IBGjpoJCFAdJzPS0ODVBMTJ1Iwtz0NyvrZrYhEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY5xy9dOSXrcbSmtfX6R695Gq++ZE1ie5ni7s3ShRyYKVPcZX1
	h5oPqxHIx+4/ueFR/Lb1exklrdPyM50nv4qdRMb0Sh8wrg7/yL9wLAef
X-Gm-Gg: AY/fxX4y+kWhP5V117UgAqf4fotovmABC+CWsmDGKirSWnG0Xmx4ZtJevGq9+qBQ9kx
	L0YEqj22Hz3MXt3Pu4QQzngqzMTTYV8DDvzxzNNTvvbUAtlAeuiAyU7KCjZw6BYr4WzLuEa8ux2
	h+SI3e44gUynwxw1UlgLKa6IhTz5gfxphy/SgQvCSEspKXv6oDLcBVPrmLkW01h9sSCYSy1uDgW
	V4blkSIxn5GESOTi7cpZSEpHye8SRPXlF1s3Zm3nPSRMnZrWUG/SzZNvFMebcQttz/xjg2ShoAM
	aQWqSsFxDR/O4lVPYx0xXEiAuzr1W2wLAw1weYD5KXerDe036n3Xm0I1DBlSoDcEYxMOCVvclEJ
	njC6fGOA4AQnLtNtGNHyvhmlToopVk9QY8Ccz6XdMKcBnRBEEymrkBSB8yASzSYfj/4T1q/FL1H
	cIqufYdT9lVzT4S1bkJQqnUp7ChwL0KQ==
X-Google-Smtp-Source: AGHT+IEcabzDD5xlxV58lCKg2Qmkv0o5BSmhphbdVWQ6X70iZBjm/abogdhIEaKVgg6QLlTaimW3PQ==
X-Received: by 2002:a17:902:cecb:b0:2a0:8972:d8ca with SMTP id d9443c01a7336-2a3ee491c20mr198647775ad.35.1768310572390;
        Tue, 13 Jan 2026 05:22:52 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([113.23.51.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48be5sm203841475ad.30.2026.01.13.05.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:22:51 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: gregkh@linuxfoundation.org,
	pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v21 0/3] leds: add new LED driver for TI LP5812
Date: Tue, 13 Jan 2026 20:22:47 +0700
Message-Id: <20260113132247.36012-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113124053.GA2842980@google.com>
References: <20260113124053.GA2842980@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 Jan 2026, Lee Jones wrote:

> On Sun, 11 Jan 2026, Nam Tran wrote:
> 
> > This patch series adds initial support for the TI LP5812,
> > a 4x3 matrix RGB LED driver with autonomous engine control.
> > This version provides a minimal, clean implementation focused
> > on core functionality only. The goal is to upstream a solid
> > foundation, with the expectation that additional features can
> > be added incrementally in future patches.
> > 
> > The driver integrates with the LED multicolor framework and
> > supports a set of basic sysfs interfaces for LED control and
> > chip management.
> > 
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> 
> Still does not apply - which branch did you rebase this to?

I rebased this set onto linux-next, specifically:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git (master).

Please let me know if you would prefer it rebased onto a different branch.

Best regards,
Nam Tran
