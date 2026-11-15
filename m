Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794701655;
	b=19rvmIvoqFfrhVlSE7GpAKK4qMJL3oyv+puH28iRvX0+DXpedcuzBTNjIPRWja0E7VLl
	 CwxkYB3/3RLjLSrlgnqHqRU/sfBKm1yKMJJV4lgmcRrlZ+s3Wv4xBK9SSLFO7fXfNsvZ/
	 nQNLFswxBrPlcBcf1hHfySjjy0WmWH8nLkEUGC5Qsa1gOSS3WIrA0y18U10TFatC5Jr9r
	 Ctxz0EYBbe3j981Sa/sb43ryIWv5yTCExaWrsUEbrsutBCi2PfDxfOtBGygfM0K+s+v5D
	 cmt1AusKhyDR3bma+pROhTbDEph/MIUykR/jZ+Jby7OOtPZ6v+WIAHisxQx6zASFM3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794701655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BowdHmWbI0HF2cyBE1LmXoTTFShzBjfQ5Hp9NB3N4DY=;
	b=lvKzsq9i98J9CufcYbXWixjzB5blsRQe3qTxvV13a6kuAgK8dFK+GToIvChJ/XKxvvoF
	 JFMUTRsQT9oM97GiMYXbq1oEqiy2DlavV8hpY2JQofSMXFKUUZVQdqTvboUR8peJAlqxh
	 3TfSSBxKXLte420YrqwCHoH+FrhR3fM25d4OoOydZMfwiui+c7Qjkqut++FwrPTSeCDqk
	 PeFT62r5GBXgYauJGGNgmb6gidxJdu32MV/KzU5yx6DsSRg+hzXnetqgzj9hufFl8uAz+
	 rQBwaLLmDmxBAcFKgMr+Xa9gf6rYWDssOlyzHmaRMA8/KmV4lcQh9gfs3pOi/uo1PRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysnHlMCW;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AF8606A329
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 00:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94AF8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysnHlMCW
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so26031405e9.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 16:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794701653; x=1795306453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BowdHmWbI0HF2cyBE1LmXoTTFShzBjfQ5Hp9NB3N4DY=;
        b=ysnHlMCW+cjJVg2dhZMlQ8eO4cE1Ynwiw8m2ecVAhDovnJWse88BNQ17S+IpXzg0fj
         B8098OeXf1hGGjC4dwNlQ51O0gmoUL1oY28zwe/zn8u4nQTqk94YClA1Tsi7K1N3E5eA
         T88cOEZci6DnJoFK7UODNSYT5krNE2r+C3WDezPuySuF2sNc/CmSRVzHpKWvgdumfVN8
         foxfxE6lphari5tDBs96CDA5jgdQ2kBuWnk8PvkZ4NdUyuvlfHhnsDbpEDEnExpY+R21
         7GkrJLoosfplhd2XkgGMPbdZEmzIXjFp57EEaT/c0pZanl69RgctUXu+nuyCRMwYUxKI
         GpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794701653; x=1795306453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BowdHmWbI0HF2cyBE1LmXoTTFShzBjfQ5Hp9NB3N4DY=;
        b=Pov9JhFctLxbcNabv6XIuTedPOEktI7bibq1+CW16tplY+UWD6EPyD+WPdHug6nkd9
         yFdbgyaPDTjucX8tFs/MUllCQIX4xmywosk0ihYVqh9Iq5HCiKrXZY/ijBQE4MxTrp8o
         LbPe2bLHUB8KYMq49l0T5JipTYsB5F+JjYQNdrJE6Xf17b7thzBGpBM+XaRZXSEcII/v
         VURRCX5JG4NETrtbJHFlepKW0PSvGR6b0au/TRKSRo1k6yOREKK+j3FqjU5zpNIUKWOw
         /of3jUAuW8lzAncTOsPaHmS1AR4udjngQsMhAnSV9vK4LaKQ3anfUIq07qYbk5H6kZq9
         Hb5Q==
X-Forwarded-Encrypted: i=1; AL+hErGPOn9LkfCIhqwOq0HI9sX3VTGesl/GVyKwgieFopKYychgYC2JklfxWjkh4LFt9Y2gLX2sqAirOgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z85cz0wd5+upNz65Tael1WCieMBhNR8jXpPvzfvn+j09UpvoQGa
	l+hMi5Jg0uIgA5v+2hpQw/JrKfoT6swP+m+cIyUsMJGx7FtI6VI11o8v
X-Gm-Gg: AYBFou2noxHj7UAajGQALZj0yFQrQApw3oz+DKDAGyKRctvruqnKGUw4K9Dpkot0oKd
	Rq2wq4Jc0GIrcns+SP24CuRjg/rPgUP+QT26+bAQUI+a2KT7t/H32IFLDQcHwM2Nx0x1iJ8FW6/
	30bzYf9fFXwv1vr7PJriRIKcBJsIlAIoNn9Z7fMTf2AjMsv8WzVHh9IZOTq2sjgCzs3sQTrVF+n
	z09PkNBdpr4zcI7KORaH9b8iRI+vnGdOLLfZct7D6GXT09/oc4dSjBnL4fFfb32J4CAScClzaY7
	a6h2XbXqiYU3LQozxqSELXMN003Zxkhu3cC10xX/nod2embHtp2B8ZMMfkLf1y1RzjbrepRPAA3
	I4hPIQvl3wYoPdSjI43lvyuckIB5wH+MdDpBlyA+m/J/bGSsIZFPOp57QOVH5jCmYksEya8QuWo
	cpyICapjBHa1M7WqSCOq/UBQfe8aQ7/3MT1Y4iP8182Yps4zlifboewcm4D4B07AWYacdPwcy32
	exWBWVY+XRG6PAIrsEN0gpURiShaQ2h/pn/PTxec6UqKs6CeyeamaV5OCB1GPyZ051+2/Qom0z5
	cqsi3LjDLzFIzmqh/ViyQijWGkalCqrnQTGpAmYD+cUAqZYyT1tNmwyuDRymZeVStrk9IaxVJFv
	0q4/PGRSIGCE=
X-Received: by 2002:a05:600c:46c9:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb55a5fdf6mr148913485e9.17.1794701652783;
        Sat, 14 Nov 2026 16:14:12 -0800 (PST)
Received: from mohamedali-HP-EliteBook-840-G8-Notebook-PC.. ([197.18.115.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae4414sm177925125e9.9.2026.11.14.16.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:14:12 -0800 (PST)
From: mohamedalibouhaouala@gmail.com
To: willy@infradead.org,
	jack@suse.cz,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Mohamed Ali Bouhaouala <mohamedalibouhaouala@gmail.com>
Subject: [PATCH v3 0/1] docs: filesystems: update VFS locking documentation
Date: Sun, 15 Nov 2026 01:13:33 +0100
Message-ID: <20261115001334.23026-1-mohamedalibouhaouala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114235426.20408-1-mohamedalibouhaouala@gmail.com>
References: <20261114235426.20408-1-mohamedalibouhaouala@gmail.com>
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

From: Mohamed Ali Bouhaouala <mohamedalibouhaouala@gmail.com>

Apologies, I accidentally sent v2 instead of v3 in my previous email.

Please disregard the previous submission. This email contains the corrected v3, rebased onto the latest upstream master and including Jan's Reviewed-by tag.

Thanks,
Mohamed Ali

Mohamed Ali Bouhaouala (1):
  docs: filesystems: update VFS locking documentation

 Documentation/filesystems/locking.rst | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)


base-commit: 23c62304dde29abe92013d85910d03a77dada35d
-- 
2.43.0

