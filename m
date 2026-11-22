Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795357830;
	b=h7l90vTAkauPslbiNqcQklwEQNfPkv8hC6NonQMjGfj1ZkOeH//tKryJ6hHUUrxcsmZR
	 OUFMU3JEV/YgPuhD2dmVPsx731gMMeEc6FQcFMqf1vUmjOyO9KG8nvedDpjPJNpsJHc36
	 O52wHIm1kQwmj5MQVAgsmGDpUyBG6StUDjf+7k4ITNDONpObLtF8B9PuEp6aUh9ATRLdN
	 0vpZ+K4986+9vymYxAvmYtA2VoA8bN7qvaG8ylPUaiFeb+gY9lgRYzHJ8oU0qEgqurZga
	 k7XX4FI5JHnV2kbT+mWSMOrfztepQ25C06Barzk6HJsV/H8HokA/92kGGZyIpENMecw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795357830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QBjN2nkZH7Gcj/ZwiauxMt+VX48sTrjkI/4AB/9s0ZI=;
	b=WFkDbPmLBN3e8F5qGYEdd4FGDGJ1TPgcGQR10iY5A6VtGvwHG/ZttKGlyXMmZ042O2et
	 EKQ9j1xeln5+9OGlbF69LgXsBFEYGa9jWj/ySnK09hsF48rzMenKiSVCo+9ZjAUQuegqJ
	 Oc8etApYlhmg2G0Z+sjNTJBFwo7cBUAmB8/6N4Kho1QrAohSr5DIo/FH4+hDNIgvYNyWf
	 xMvXVNUf9r+q62ka4Ho0XJBw4Zl4qW6OaBL4pCI2Ek6DZqAAwhC08SDUCfJmUiCmoV/Pt
	 7/9wJ0DT3+OFPL0oGPX3I5/tQJ7j2HkvgTBoElI77q9dr4XH9L9EELNa7ce4vjwAz7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEudPq9y;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD6F606A336
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 14:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD6F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEudPq9y
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3866a784546so2954456eec.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795357829; x=1795962629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBjN2nkZH7Gcj/ZwiauxMt+VX48sTrjkI/4AB/9s0ZI=;
        b=oEudPq9ya2d2ROLpUFNzQ4XiHlp7ADIN+XNA6G1p9I4nYDoV3eFVMegchsVJibGgHS
         Ny7j2I56wtelFeOltEglS6WsBi5zW1OiOGwoG/4MeAfCj/mZVYM7ppcrNgcad87bGbf6
         xGnoHXGOdgh/O8fA31vgDbvh+oau6MewMg25hYRS1qHURsa0Fi2yjma7MLOJvYUGvAy/
         zZu2h+AO2PKoCh8uV+UjDGJOhg7yw1I3G8j5rHWO9DCL9afUpUDpXjkOcQN9yEJC6p7E
         V/gn2CcvVKVol4dD/AtrwK4I3lf2HWeystQgnKw3GHzfIZilzEtqs85om9xYwx4Ra+Tm
         BNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795357829; x=1795962629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBjN2nkZH7Gcj/ZwiauxMt+VX48sTrjkI/4AB/9s0ZI=;
        b=b5spjAnMqegoG0bCeDyA+WS3pQpZk8mRlvf2mQCO6Sw+Y7MBqr//wi2KAVmktAqw56
         0boL4TfKVLZ/wFSiWGMpw4BXhW3QHC5/oxC4tQrp4AsCmxFG+SB/KLI7tJzpT8CLgGpO
         yzYmEDPSGdpIdmZbXHUyNfapsoqTNM3SdjmXbF+W53UrOj5LeZb/r30pq09ArtdL+5A6
         igVoBR+DRlN1UV6bwkOuuNYC14ks6axKowtRknSbTxFXSsnf0oMsaBhRDiuJrobdVLBg
         bsZgHBsTVpdHxeP4XQCWkv1Fp0a3wStZiVVVDmrpx1wXz0GjQNgTleztmt2DV0Pefrnv
         NR5A==
X-Forwarded-Encrypted: i=1; AL+hErGGLP2QUsMn0mEzuEQqC6704a4xhfXIEgbXGSpkox4riT0q3LVM4D7OcxG/GIj8mdfT5phNg+sFHOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Unf7yjzLmzwJpoT+/OSIvz/1DS02t9dXPQ2xvoPwmj8e6cs3m
	aM688PXZPEYKmZ3ZaezSpogqi/XxPApwivWKr5+AwU8lHlMVW9K/F88e
X-Gm-Gg: AZFdTZcK8Wc/DrCjvkdmZqRAApltgnkl+C5gCfbf4OBjdJmrlv8oI9Y2jppWbv6/lUC
	IAJ4Q/TftLhjmVQ7XTBl+FzOkWW1DGkdPA0YZUasKbTHvCCa/NJhJFq5YcC1bWUE0uz13tpfRZY
	8WvcuzKj+aFpriO5b7fjkwYuZamxkR0g7+WDofKx/isOTmGHSUXZKjjxVABn4I1UVNXpbTvXJBk
	vqyhAserZKWDGL3l2GfnXP2PiOmEmTAcL4GU+VZO5zA0VO6t+RJ2EfEto4qRukPNgs34Fq+WQ0p
	VK/t4TnZ5OvkfAAzA7hpAgwTtVjd+LOMxbzbtGNSgNkhhJ97AlEVwRPdO4B/RL/MWnwnCNQwpTD
	fYMWqA2XII0n/xhDDaSDOn5MzjyXyJBEOfnfeRvucU479JMe69kU1N6c5QgOJL13AbssZY49PVa
	VjUI1nfFp/Zh0nCbOpyXxEh64061UGUuhCmj7UUs6LcVEoEw/xyLe9Rw2dJVp7v71FF7RtCS33A
	5fzkT+I1WAT/PXBhlw4b8gJ1yZKV9Gee8MFPhjECUu4ckWl9VA2TqYAEqnxVF8t6psRsJ7qO1Pb
	sZIKIWKy6OtUK+3xEXWNhsUz5hHr/vxflqjsTKM9UUVGrnttoMJORuwekT9vMnHH/GPPZ3A7AyN
	AzdrHdArUZEIxbQ==
X-Received: by 2002:a05:7300:e9ce:20b0:36d:5102:9974 with SMTP id 5a478bee46e88-3856c2c2123mr11231914eec.2.1795357829128;
        Sun, 22 Nov 2026 06:30:29 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm27877901eec.9.2026.11.22.06.30.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 06:30:28 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 00/27] mm/damon: let users report their data attribute findings
Date: Sun, 22 Nov 2026 22:29:52 +0800
Message-ID: <20261122143011.85844-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121210013.130397-1-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 21 Nov 2026 12:59:44 -0800 SJ Park <sj@kernel.org> wrote:

> Build a system for letting DAMON-external entities report their data
> attribute findings to DAMON.  Let users report their data attribute
> findings to DAMON using the report system.

Hi SJ,

I'm reviewing the series and setting up the tests. I'm also working on
follow-up test patches for the report queue and its sysfs interface.

My schedule may be a bit tight this week, but I'll follow up here as
soon as I find any issues.

Thanks,
Lian
