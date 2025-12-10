Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6269D30649D
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 19:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765309489; cv=none; b=ssG4X4omaD3zKhAYgSwSa1vcFBjLREt7PAta4PFl7ycyA4ESq/WkUy31dnrDk+pa1qHVGM535hs1lyYhrQVTwG/DZh6lfvWnPYTtLi3lTWGvd+XlA9WhFyv+oLSkGRNrwt+Ac40gzQ18d03ttibtp+qdnTl7jNJq1KIwUfkjaH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765309489; c=relaxed/simple;
	bh=eLfvDGu5s4ImYReJmxrx9D5VTM5Uk6aWNcvoNWZtd70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HnczPbNnwIYVvLtNfTeNCCDUmA+wmA5KFdw0jyE0Fyf0GSPuDtsM60/F02eiY9VvZmW6Sa3zTuqdTxcbYhlNvwu9BOUpdV0oNu0EfpYWi0egUSOxNLc8SAWK4jp/G6raKT/Qu3qkgL+1S59d2/3bX9/vie9EjH0ShIOuUvQQFm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDsYUDrk; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDsYUDrk"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-340e525487eso4780752a91.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 11:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765309488; x=1765914288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLfvDGu5s4ImYReJmxrx9D5VTM5Uk6aWNcvoNWZtd70=;
        b=VDsYUDrkShBhG2WIZeKRbR4MFsc9rFVJ060zdfj+35PGiQp+3GPrBvIngGdTAv8FZp
         4Lrx8iUMLmvTbqwtQnBwuuAUUTcXeYlbRfWvvKBYErljTgpGwKxrcDjfm7YJL3oIMy1F
         7E6NmWokOnGH3XMzORq95DQuAVCh+zWR/4RvLGQYnQvMmqVFBgMNulVnXAmoGNs1v5/Z
         yzR7sJpl7TIsqGnNFj8mur6iQPxqa/Ro0M2sgSlr7mPbnjLtQVZLurWV3FgjsQPtk2EP
         a+Jqa5xSVLIAxGY8gSZM7pKLGJFxcI5a9IhhxSfdiT7e79arQ9GVXBWfSYxPo4sZiDl6
         3aAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765309488; x=1765914288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eLfvDGu5s4ImYReJmxrx9D5VTM5Uk6aWNcvoNWZtd70=;
        b=LokwZAy+abNs58x0BbMl/QF40WKgqcLWrFfrGHTd0BWGMAu0CqZp+F88tnhHcsiUQC
         5AbRbxjSil8OqziwapCa8Q9ZmPfHGXtAqYa5mtKepLV6RAEy2xs3Aho5Uj2EXTDSV1bn
         EkzAh7rSS2VpejLnrCVJOZN/QbYaA059ngXR/PgIR5Rdus1i1sSB/KX88oT8ptpTvkGt
         vUhHIEHzzRlwYK89aYX8fbM+wtTPf7mDA3g+beOJsa3UNkEJVwMQZtbDF8HhaCzZBe/k
         4c3NjPFedosujJlIO8bWnLM19akS77WXt1KGMso0+JXYOc4tB3ils4aXDi/4Ko57n+Fa
         cfaA==
X-Forwarded-Encrypted: i=1; AJvYcCUZJIYgLo1OZdOZKhaPd/QGQSfRHK4h3woe4APkHIv/m1PdFV9p+hdn4o4gNUv7dtxl2OmFfILBxH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGQGq4by5Al7AVY9l/wqYnu58o6RKi/XD+Co1QBITk31vLfPcK
	qzXE7inhuJZ4WDIULS6z5DGWFgiLavxDMSEJOfAjd2cRRZTr3fP2U/5S
X-Gm-Gg: AY/fxX64hZ1xCjZWPMtJMA3RKSASe34VyiMxZFoQatgA8wg4Q3f/JetwSfR0QjFylxS
	oWpTxk1QIjn+CqWxWbwUI83gUnPT1vOOl4Vrm891cWqzCzY4eRx7bl+5b3Jy6yVIBeqgr13YIbC
	Hgx4tqUV7rT5bO5ytx+JjVoayGyJmnvRxzySxEXOWwlxRlRmUTqtCI8h36El03r9RRFLUaejt4Q
	o6NJVAk99fQxee2KJN+lv1NlvHEyKx2dPq64ij+aF+GwlR31D4cPSbbyS2Coi4z2XR3zEBUuOCs
	tK6C19FlXuPP7nxHamRdjeIzVvkxioT4+YIzfoLSS13rS3nPvVkA9IGOrMN8BWnSsB0cF6x2uzK
	LGp5RNFi5Dc+/lvtgN1HEXuon8RhP0egZzDQQ+ZZp8tr+KjSQys92JSReGnn1ybD1MONqWE9HlY
	jsh9czlj4Sly03bN3V6eQ=
X-Google-Smtp-Source: AGHT+IHSmlXiak5qx7u1HGPsl+hG5bQFTE4+GjA1E5FydBcLB9uUfRw7R0nsErX8uszlOea8oXk8aA==
X-Received: by 2002:a17:90b:4c50:b0:340:2a16:94be with SMTP id 98e67ed59e1d1-349a24eab31mr11084598a91.4.1765309487645;
        Tue, 09 Dec 2025 11:44:47 -0800 (PST)
Received: from LilGuy ([2409:40c2:1295:13e8:41e8:60cd:6181:4fad])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-34a7011d851sm237464a91.8.2025.12.09.11.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 11:44:47 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: mingo@kernel.org
Cc: bagasdotme@gmail.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david.hunter.linux@gmail.com,
	hpa@zytor.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	swarajgaikwad1925@gmail.com,
	tglx@linutronix.de,
	x86@kernel.org
Subject: Re: [PATCH v2] Documentation: x86/boot: Fix malformed table in boot.rst
Date: Wed, 10 Dec 2025 01:14:35 +0000
Message-ID: <20251210011435.6241-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aTfjlAKBNeX6my4g@gmail.com>
References: <aTfjlAKBNeX6my4g@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ingo,

I dropped the leading tab/indentation because I noticed that most
other tables in this file (boot.rst) are left-aligned without indentation.
I thought it would be better to align this table with the rest of the
document style while applying the width fix.

However, if the preference is to preserve the original indentation
to keep the diff minimal and focused solely on the table width fix, I am
happy to send a v3 that restores the leading tabs.

Please let me know if you would prefer I revert the indentation change.

Thanks,
Swaraj
