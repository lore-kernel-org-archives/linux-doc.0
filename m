Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DC5733E
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763535641; cv=none; b=J9vkBzI8vn6TUoU4y+3kchaLaas/PbfB5IARhfQNZgizfSBocmfDuYPbzq67czSJnOes/Puxjj09KmDuhqXUPUyGVnjoRO6MOfvy+iIrhdAFSkOcKd2Bj4cntnLLvR9808VjXWcD3+4PbUd3tmGcY/ldItcV7mM+REY/QzJA1Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763535641; c=relaxed/simple;
	bh=YTMGjhB1zAPPuWlzrFOlsA10AWeQYE3K6+gSDbBb4jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oI7/jmnCIx/uYewxOnoWS3s+YTFgVHplXgElg7J5uufxAzvglFSV3MYSO3Fpl5fMoywykf2z65vbnE0/1oVnFK2cmvREEpI5L4bardbeYypckqXwwxNXaYTtEKAE43seoP2B/f9/dNxxfsM5wgYScpV7GRUHWX/ID7yPfBnFpMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvIgYsdp; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvIgYsdp"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3e80c483a13so3518543fac.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 23:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763535639; x=1764140439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTMGjhB1zAPPuWlzrFOlsA10AWeQYE3K6+gSDbBb4jY=;
        b=UvIgYsdpgZOZWZa5UKTz05bP2IKIuKVaiCV/nkrJH+CNl9tV3Bq/Mh61AMR5QsQDx1
         Q3UNovwP4Wn3dKynub2QREm4ixZwXP9YN+uIaAVlQe8Sl9DUQmhImFP8239MjR9ywo1w
         n096DZ6LiQkxZ6/qhz1IauypMgVqCILnnntGPYCqcae6o192gdx+mbALuqVK+c/hkzrf
         C0lvaX3UN9ZyGBh45J1zbpqZsqE4uXG9GCWV06SrZdd55JMyv0I1zaOJCPiJjygec883
         1wUp+WzZXhGnOyQM0LuGMh/tyEc+pe5SMOSR+oP2xeNZpciQasGzweQpNmINpHzuisDD
         xNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763535639; x=1764140439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTMGjhB1zAPPuWlzrFOlsA10AWeQYE3K6+gSDbBb4jY=;
        b=ZHbvGhHP5DuQgWcC4QCMcI8WUvJ0zLpJCQ3+0Z3QTYHVHH5ikdEZATjR7PZLqlQfhk
         iyf+ezhBzPqmvV1R0VK4LwLJFmc6kN6z24k22mi+8XgnaaXESizvAFRANXT63a6KL/xA
         L419rMWvbqJFpCWJAJE32MnQ4NPuJUu3yJRnkyNO3SoAqzasTBsg7/FXhfmgkNWKNfld
         z88Z+8BT8guhzpvTF7e+uwzJ9Esev80eIHjXn/XUjg0rl6ZvVVXlbM4qmt3iBfTmnJ8V
         yJPVJ79MVZzmv9wN6hCpjH7XOQhB2ViTbF6/QcBq7X47QS2A6hlt0CpprLNA9LZNu6DU
         fsnQ==
X-Gm-Message-State: AOJu0YylYPWviTJIX7eu4O9EONi1gZwVfGVmuTlR2RwY3lFCfAWKOlSd
	wh/H/4getRyRjwC4RPaoWjlNowmna3QeT5H7B9cFa64pRd71kUXNOOG1Bu83PdSLCniPUqjwXLy
	tJ90XRfPxPbhKTo5leoyV1uy4+Z5hp/+SdrSNwJgATyPR
X-Gm-Gg: ASbGncsNn3uFJYXqOcQNsK+8RkWzcOGC8EHB24ebFtdPSapTZ0kh9Ijn17mE9L5jgHc
	SegUsYXfaSsWDMqU5ey85oPlZHAG/a+7/Psm7+EdrN01B2WS9Ic64UyBCnZv8+5mCJgI04KfwzE
	PxKsO9g8wOEtGtK8ux9VndiZ4HIscNB+lQmSciuhdC2P+5bqleYgv1ysx29WT4HApkjEGAxl0iq
	lfFfljJ4UbbrtD/GNH1T4Z4YfpeFUw2aZNlnPvQ5mCEAVGH4J5iNhraE2z4Rwc2AmDYvn6kxHUh
	xaSCtdArz6qgjw4=
X-Google-Smtp-Source: AGHT+IEV46gLBP3XsnjFXPZuHD61dBcXz6WzaKRj+0tLH4a7hgrXhTS3we5SjRUr+g1S4m8HUZTjVlpe0D0o9kISz0g=
X-Received: by 2002:a05:6870:938a:b0:3ec:355f:7b14 with SMTP id
 586e51a60fabf-3ec355f7f6amr5530345fac.41.1763535638872; Tue, 18 Nov 2025
 23:00:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFb8wJvoKtiOA0DZqNJhHALe97=BFkGeLwDYpK=x7L1woLQ6NQ@mail.gmail.com>
 <871plv5mlf.fsf@trenco.lwn.net>
In-Reply-To: <871plv5mlf.fsf@trenco.lwn.net>
From: eanut 6 <jiakaipeanut@gmail.com>
Date: Wed, 19 Nov 2025 15:00:27 +0800
X-Gm-Features: AWmQ_bm31LQUxIvDrERRhVB3caCouk7s4QDzLe6y8jb0A6QqJhIhdG0z18t6qcw
Message-ID: <CAFb8wJszWvArRBoMP53TLuHji-0JdSN66TOwRfbgtO9DrUkBSg@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/admin-guide: fix typo and comment in
 cscope example
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Thank you for the review and the guidance.

I=E2=80=99ve sent a v3 of the patch.

Thanks again for your help.

Best regards,
Jiakai
