Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069266;
	b=MRbkD7cwjWIdT+nLvoNN4WE501SU8BvBXMR6suuhYqbOgo7z9MpLhI6VO5z6NTIaSLiA
	 zf6I667v/x+IBWGqqIU3OE6+5G8BfcTmJrbgdjeIZf04mBJ1XYIo5RsqqptlINyZqtsso
	 LHdJIFDoQEHiDEPHHxSGbDqdW8Tl/9UbR3R+qtldca21KTLUS66EvVsU2OSx6YAPp90EA
	 S0XQAuf9XrSp/SKfT+DjMh5kVHX+cpNuFVXyjrqu+j7NADdZ6BF0J9NEqcUhGW4KDkfQZ
	 yTDiPlVlgWXLJtH689xlL41ZPRAyVzUjtFM0FTyquOOhLdtapi6pWSpfPEtxs1wTi5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID;
	bh=lvDhK1lQBCnTBgCeDn8IE0UD8FXFRVaT+2qmolhhuoo=;
	b=2iFYs3JAoRGb2lCCNNZpZFrlKVHGHn5JO1o3OctxbW+yS6E+OM+QFK2W7Jd7IATloPxn
	 24BkgsiDCFVHbTUDLJFjIokkc/z/yh7i9cjj/eU0EyH8K8n7V0O6YyrnJhpGlqbY5uUj8
	 Z9glM0n9P8scAXYiLpYzpkwsNH7b0rINIBxC73A3/Fy45Tm8U7/zCVZQvyvG9gH7Ojufm
	 QiWEcJV72FTXRdjXU1t0j9tHgjW/t+BTFyyycDdDFGY5CjCwDedy7aXxtMTxdJU0OUTf9
	 R90FaBCbCep/hMkbg9VIypw5MNbSe84WX3L9z7vrrsSPN5ALezYAJvCUMZBfHh1CtCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ExcyeD3X;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F748606A31D
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 02:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F748606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ExcyeD3X
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso707933a91.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 19:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069266; x=1793674066; darn=vger.kernel.org;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvDhK1lQBCnTBgCeDn8IE0UD8FXFRVaT+2qmolhhuoo=;
        b=ExcyeD3X/eASS+Lt56dL6RiK9ULFT3Pc5YgWeHYUVnK3/fxmU3LjuVBY5qTgq7Nvw1
         5AmuEADgEJ+/9hfGT5RCvUELhTrKvjgbL5QbdIpi0QElAaNOl+gXJxtL9+Av9cQKStdk
         HFUxpii0/WmmdMYFkCaaF/z6fdIE+/OGEM6CvjRXuOVZbt47YLk/fQGdZX5Lx5FxIZlr
         vDx92Syx+RaKIXdx0aZbxswckdlg4CgI7tvsMxfzJOw1v3dF9cfweP4nJm3wTgr2tWNK
         Kr4Z7qkUZOO3SaQ67nbMvxAQ2BKrTB77BvLsWHIDw4RjzHRtP/CMZ4Z+Hf3yCHtMwR1h
         4hJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069266; x=1793674066;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvDhK1lQBCnTBgCeDn8IE0UD8FXFRVaT+2qmolhhuoo=;
        b=ER5km/ExMtqLpDyabWYmst1O9Bf1G+sJF0E2Cu1gY8G4Q57++pB8+SIqt+I25ep3di
         3KdNUgjXjDvKjkMN6w+hmPaKbUdPkiIfee4DlWQmQcZGAWhLaa1OETgLvWpe3uE9Xbyq
         aqJNS212TFuu58MPfVb6SJMSMTOTKc5ClOpfEpWVYZIBhyn5xpd6dNuJ8dUxKkrsoYQL
         tkKPODFhR5RRI4EBVv+vdWrj9r9iD77/9KW8m5M4sCddKbt1UJJN0pbjRTgVh4hGRJQN
         tgc42YagoAEsz+IbFPT7+G9L8yHJ3FW5hG93Iedcdx5SZL1VrIA1/siWblODcr5x9hae
         g23Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJcECyiT64DfG3/OwjmFaG5cNkpGQP3AcTqyLyrHd1jF8qPyeYtDlTbxREuc65TrIq2EGOMwwjpEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOjhGZ7mnBwqUTNYbOBDfD7a0Y1yfbohlsONDPxqNp8ozp45h9
	qWug3c1YV9QAoUcMbGsQsegAYy2FVZps30jtsa3VUe5fF35wJVjjWOfZ
X-Gm-Gg: AYBFou3FtbhZzHuBTs5H5WbpNYYOiHh8He2rCHFbL4mxqb/FS/dTiVGRzDnx6D7qcoG
	Ns/h1eTPupXwsHYvpHQ53AwMASZ85lQSPxs/5HvO08r23I5q0cKdwb4avoECfPRw1SEQ564Aw4Y
	GdRAxCFXU8EQDk//rgBuZ8ah8SJ256Gd4Yqdsya25dirjp4zXFALVr4enA+ZLHsPZK4rSPXvewz
	hy2svIyDWo3WGnhcDhrwxxAzP1+Wz7J7hjnqnwhnjZvoEuo1g/tBHNWemhNNNKBT+r9qORWLf2Z
	+UpTHY1dSE7um9qK5h0PQ8POf27J4mr1SnSXsbIWu1s8zl8CcLxKcwGYdWRgdtyMdoyx3dJ9SRk
	Zdreq5Ks3jHOBcZAfLUu55PL/vGXyYGKtgPxcmFIwojfIlCjqBgzUKgmJFCyOz49iOi+Ef5oSd5
	GnQ0thgbOhCJBI/84SSnbv5xbIYYN2e8/IidMjlvG3LeU8yIptuhM8lYt2kMoPHWt1raw4G3v50
	HGf0ELu7EBGkYqPfzzUv7TeAnv4NIDl8wpNKNYbutIDCVDBsIvxcLrR9PMmc1HvVfa4+ehokcso
	VknGT6oqW8gaXQchXyoRTWFj8fa9VyAZx1e4rxV+p98HwQO+jZG0
X-Received: by 2002:a17:90b:3b45:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3ade9b2cff5mr7922722a91.1.1793069265598;
        Mon, 26 Oct 2026 19:47:45 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404426c2sm1518262a91.7.2026.10.26.19.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:47:45 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>, damon@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] Docs: damon: fix grammar and typos
In-Reply-To: <20261027004916.160854-1-sj@kernel.org>
References:
 <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
 <20261027004916.160854-1-sj@kernel.org>
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
Date: Tue, 27 Oct 2026 13:46:00 +1100
Message-ID: <179306916017.2.12297411301652219760.damon-docs-footer-reply@gmail.com>

Hi SJ,

On Mon, 26 Oct 2026 17:49:15 -0700, SJ Park wrote:

> Are you intentionally removing those suffix, using 'git format-patch
> --no-signature' like feature?  If so, any reason to do so?

I was trying out my own script to assemble the patch emails this time,
and seemingly I forgot to add the Git version footer. Thx for 
reminding me that.

Thanks for applying the series,
Aveline Noir
