Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF373F0750
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 20:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084993; cv=pass; b=kXx41gtUYrUeKBeLKeFvYdJmwLhf0VudPPyALTfHuDQdLGQhZFk+o0qgZMWPKwrRLZxJtAQ9oBfzzV73FM60EVpemzmmjdE5D7FvApiZKaJkOzwbMryfb+qEZxyKOPADwG1Ohj6RIPY7BOKaY5nopg+ZTBS2K/TtnsHuiRyuKOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084993; c=relaxed/simple;
	bh=8vV7V3CMoBNjkJhOUfmZqE5k0G0M3MxFKAVMCFWrXI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfvPkUDYRnUNy3ManPh4PeiJtBgr7WRDVcHcPy2aXcg+g13Rz/HZr+x4rsWm7WBGQs9O9/TKFVM2Z0kbjr6TRcd9dGQ9o8jXsXvLJiqIOUOQskBve0y+49zUwOL15Fp86vJoyEU2nhC/MfJruEvYnTzJ8JA9G1nG32wFwkwgPj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rg33rV7E; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rg33rV7E"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so534866f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 13:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780084991; cv=none;
        d=google.com; s=arc-20240605;
        b=OcxJrmru4lBW31ZU3mPMv9zUHO08tpKCigaDrgCjPbISh5I87ZooRQmctaLdZKXWZb
         XassrHGeuphdO0U98Bk/pm3LfTpJ0PsVZBUE2T7MbT5R/coRK+oaUeG/X42oRb7mqpZx
         nE2nretEOPQc8R/7soxueiiwERx98NvT3x/MQnUsBa6QfcLpNpjJzmMtoaWDMMiJzw5+
         q02tIFQbXxq3VsVOilrU7TB7k2X5CHhABGA0ffqIRHjrxtOPaXykBq3+Rds8I2ve0JuU
         i1v1VPKHQ6vndvNMoIcjhyA07OtN6uEbnvCCYBmt33oW5p+b16OFpbmX7Ygk7rBndKGh
         rI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8vV7V3CMoBNjkJhOUfmZqE5k0G0M3MxFKAVMCFWrXI0=;
        fh=IdbwiqBwVLT0orWdIxE7wEczom9Mb4FSoyfOo0Wf3xE=;
        b=QF6YXH/SLmt+CLbgeO/G28TgdyDAJOSa4S6d0575KdtrL8DgBAUifUmJRYbSERf0br
         SCoDNgw/KZ13loY+yQVybJTsix+l57L9Gr2EQAPQ9GS4AIkeRPzkKNamwMHwOFFap/1W
         OyRKyLbP6U8QoiR901pXh49nU78Pkq26KVpC7PxZ1ojrL8b+W9ievZS4P0ltPT0ThsYa
         VfchVJJiYZ5ZWZZTKn6nVE7ptrfxY3LQLK9mSggdqNN8X7f42OZjvwmxSRM8MR8xYYW6
         ddCoJ8IHq8oEH7/0ODc8X8TdxkbdLnmcO/VjC7zvLUI1b/fDJpPWlhsha/Nv6tNdKr9A
         Xa3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780084991; x=1780689791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vV7V3CMoBNjkJhOUfmZqE5k0G0M3MxFKAVMCFWrXI0=;
        b=rg33rV7EsQFtyTgiUjK2Ackzr3TNkQBpZHUT8+A87Ac9RXqlFpgBhvSAy5QHW+ScU4
         q15xl/aqyqG1HfygwNI7bVp3e24jLlhKeUNeugk2MPDZYUvW6tB3QEGtQawgIOnsCorw
         5aAsSHgnE31TNV1mODMJvNj9UaQY9oHphJNIvqyddy6uRz32lGfxQREy01fkjhESwAVI
         JtsLrF8BX7Z5Nqws7PKec8z1rAKiXndOg8nC/esldVX224O0ywMCg5dNropwdEQLnuCx
         F7ayUffPAKSV8gCW4H9mFdreRlL9Sz7UOrut6B269UX6qIr2uwcFkgSM84By3eKs/DTk
         BiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780084991; x=1780689791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8vV7V3CMoBNjkJhOUfmZqE5k0G0M3MxFKAVMCFWrXI0=;
        b=OyDK1edvyo2we1LmAoqVeQ8DZy+fqtdLD3if1EuMo7E6UIStehMbzAzC3c1JZQVN7A
         5/v+xDOQcGQ9z+5KdnYj5aki8sb+sK6wy6FycR4cKGLJB9hrfIxkMmuScA7Fy4N3o0hG
         chf9Sojlewi0JHPZIBLjpmYhViVsO3QNRaLgJ9+7UmrxBjKBdFjFBGVfEnhGhPkd1SCG
         wDgrcvpTRETqnnfNPQfi6V0e7dHOYg8NkIJiidvMJ2LyXtUrosuyaObtWpTvqnUeuoPt
         QcZCHB6ZildNTe8cmnKJBaxxIf75eg/rbRDTqe53Y32Z9SWNPuyI2NoC5e7DJ3p9TOqV
         nXeA==
X-Forwarded-Encrypted: i=1; AFNElJ8IaDBuaiSPcOW5e4Ukz5Ui7FWXhZoq9tDNw3TM6rDzCdRGduoEbJ82DJ/7vOBrZLHTSR7Lrg8sVpY=@vger.kernel.org
X-Gm-Message-State: AOJu0YztdjT8SVjXhkLU8GsNXR3R9UHbY7/tD7m8I6CuQNFZHBnzxKXk
	LCaZ6JQgKCFTFtSfh3iq397ILietop0bfxrSkLTRbalV8f3+h2gLIEmBQ4FYgQQfFlFYD62+6Hb
	BRn/IiRYezbqgRzO2qG8Selze17L204k=
X-Gm-Gg: Acq92OFzCNzeo3EgFaej5kQX85CyLcKW6L7IHet0wea58EhMqkjHe/QaZ4in3mQIztR
	59hMsZ8HfyRZiWIb+1EDgClrdDjfof7RR/i+V4tlMslwgZnK1McfW1zMzDPJNWLNCHVNNPD0jHU
	hJsW1IJ3LcD8Su0PoazkteuGkss3zOawCymQ08dtegijYRnIHQWSAO1qfZvH2+ZpW7yOvXlbjH0
	Tara8tKo6/JY7f2XoexiQBKwXUsg1E4jUwc7+YFQ+zCLVSkAzy3pbX8ZH8pNLlExGP+qbfIq1gu
	z2ZE0CsqlAX5KZADzsMhwsgrb5c7IZHPRFApCGU5zyLldE0hiw==
X-Received: by 2002:adf:e510:0:b0:45e:ef4a:819a with SMTP id
 ffacd0b85a97d-45ef6b1fb03mr1966464f8f.17.1780084991071; Fri, 29 May 2026
 13:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com> <20260526114601.67041-5-jiahao.kernel@gmail.com>
In-Reply-To: <20260526114601.67041-5-jiahao.kernel@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 29 May 2026 13:02:59 -0700
X-Gm-Features: AVHnY4IOqjjiOdCG6Ozo0C_CJ8lU_HS1P7B7pgVtIcaK6gtGQOhL7OfGo5YfYKU
Message-ID: <CAKEwX=Mj8hxSma0DN4zvCgRo3HMs7cbB145+s2=LbTjiKUXh1w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] selftests/cgroup: Add tests for zswap proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 4:46=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> From: Hao Jia <jiahao1@lixiang.com>
>
> Add test_zswap_proactive_writeback() to cover the new memory.reclaim
> "zswap_writeback_only" key. The test populates a memory cgroup zswap
> pool, triggers proactive writeback, and verifies the behavior by
> observing the change in zswpwb_proactive. Invalid input combinations
> are also covered.
>
> Extend test_zswap_writeback_one() to assert that the existing
> non-proactive writeback path leaves zswpwb_proactive at zero.
>
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>

LGTM.

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
