Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB4543F0A9
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 16:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306812; cv=pass; b=akDS8uVjC17SzEkslX38GV3sM7QgapXghwXcNvH6Qx/ElccJxCpSEZSfTvaVVHSiTDrEt4BWHlfnzfuZnrbRBoQ6gxakbb+OLLwiI2XPN79Q+lSWKhxA0eRIAKO+lnQ+GgTlsv4bjbMnby/FJnUeJxki4yTvsCBQDtZ2TqceMQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306812; c=relaxed/simple;
	bh=MetYAs5V2ZUfSmh7NvK7CelQ3MMy9EWhCbgsg2qDRbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioFsuRX+K198DsmXw77ewayhLfoeTMyzVIMqVQRCJWTHFDO8DK2xTAFSFNZow577GfuyHxT9VaRZM2emwdCld0YTsTQTnHJ9jX08UDHveMTxuA9/U7hBI8sIKzctBeD73//YiBkMUcEhHbuOe7Hkxa1x7wBoQEgyocnyOddrWPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSchMek1; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSchMek1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-470174001a0so2523088f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 09:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784306809; cv=none;
        d=google.com; s=arc-20260327;
        b=a8yCrbZ9TOUWUsdOLKC7FsdDJVoNjKCNGk98z3BZLvnYexMLGirQN/AdyuGLvypNt9
         kFf4FvsWbkic0f/WpWVVJWjJbpthcazO8JYLhiR3rqlSuD4OxR8yElm4lD88aIX+zmjV
         ZiuK0+TrWwtLyF9pKQ/AAuFKKiFOMwS1P9loLRABYzV4+y9gqKYGh6hrN8GeXcs/L1Qo
         It3/ULlbDwnM2vpknpWh5/wieHG21NpbZb+biN1lqy4IrsiwPjFRGY//tmvCx28UZhGS
         3bp1cLHG3ZxFdYeUU1GWV1lJRpBAfQe1oBHZ9a29dvE7GVfcMRhecygCTrh4tBOY7aKP
         TCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLbT0SFfuckzKAwHr8EBVzewNYG2dGRNTk3VlAGhSo8=;
        fh=CnY3rNuE1fkG6fS3vghfeHqLGVz+pO10DR74QXWcIKo=;
        b=WfxhyU+nUp7f0wB4GG6IQfNEtuOly50WRn/qk9qb9RfU9/XIPJKgZnq1ST4/olPdVC
         06GalCSk7jJA8CWQsKlBQjIbNidSrpAyBsUbKHlCMhaNruYVchiRxW0u47TwTdTSFGd/
         HKEXZFbwiHpJX3cuRUu9JrvvbOW2D1gg+rzJvawKodzK9tcVQG7LIu38cU4CChU8w9+7
         HBGPZjFRfLvXHVjCXJXZiwJsfDYNnYpR/Pu+BMireapz12GZxxMp0Pt8sYJgHYBLRwLk
         4azc52NdJJxfvVUA4C+j8n6WwIWE/xJ3sh8q13tC5sM2ZffVyaQodO+7Wg6Yktr1SEgJ
         r8FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306809; x=1784911609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLbT0SFfuckzKAwHr8EBVzewNYG2dGRNTk3VlAGhSo8=;
        b=YSchMek1wcL09dBvv/uF5eFJMy3bYuod03lEQ+KQLzSIlgb2neK8Sj2F3bgz2aQjdc
         9vd2rBOPMFF9E/aiIqZFHYhnK8M3r+ytyrcDbWJ/iGxbn4aAhElX0rxQ3E2tXzsXfxwz
         w0hJb9eZZcl8em7Hyx7kxafDxVP2IFfWRQ9Lq7T40y260YTbD3ZAoVOioV91QSFHuQ5V
         DOGhCZolsUln0FuVjNqJMKGcAOh7A6LW08Sl6ToQ6/Oiq9zyEHABtodh8UFZa84t1z4E
         gQwUKOeXE9vefV9TnR5TWAk4U3HtxUgNRpjfgGDT0ZvxoUtKYyA675xpYLwIj1aYTPns
         VYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306809; x=1784911609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLbT0SFfuckzKAwHr8EBVzewNYG2dGRNTk3VlAGhSo8=;
        b=p8eev0LZ3ocdheRDBFyBKg3SzqoCHX9lmTFoV2z+e05Gdsx0tV7slsAFsqJL271mwg
         oxSdCCkVXv0QR1gOCoioN5TxMZLbz4CCQmgo5RFuVxb9ze5mqkSGZNsQ084Szx+bi0Ft
         CL9IkDWB5XWvG8boGNZkf/GQw55fcswotkq5zZPwqcMrBSRdiT21udaKYfRYCnXak2EK
         XVv06KSwWggNCYuLFYo8qMIFv96aykiB+MsdmeXARNruoTZuyJS6OCqu6uuhDjJHDfrt
         cSHh/aGh0DCYxzFMMqVa+sw50sM75oVOjhRVA+y5RZtnS1Qv8T1NylxFkvVPcbGz6dU9
         2jyg==
X-Forwarded-Encrypted: i=1; AHgh+RoTFHgnecp1frBcZQzOHxqDJ8yLPhbI+6ICaDGHlJgo76h+wE//KVexVRt1MwlvRxLEGYbXwxd4Jb0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym2wtvhsQkShDIfZEDwOHe5DFwaUt0OBowae7jdVbhAL4BklcD
	8D+xYjHSyKT26fDvg3lWXc8NZIRd3KR1G8iHcoMSvWLvo4OycPDKhKSfLYmB+Q2sGW3lsXZfGy0
	y+hDhTNV9xSqB6XHwBGYOBQhV76znJDo=
X-Gm-Gg: AfdE7cmCAm6+63OV2BoTLx9VyHKapGnpkMkcP8CCU6XsDvfDa7uXD3gxO9PyoZDrD48
	4l0uMbeKohUWVMSxtY6y1QWRjYNe7HGzT2x8JKs8rd+cKb4AD+dPQbF1cNYdbxKnZXC5viQ3Ox2
	RzAmFPbBxdajuUy3PpUu83PlijUIIY2Gl6y77r39TUjfqfQa4sUbe4MunIE9nGdRXZOFLU7Ayah
	qbhL9Krone0MjY3ieEbSvcrydZjtYPfWpbCKB7kXNOXEZCePWcAnHO3Kn6PLfZZOwe6hhN7pvgv
	XSL/yXLG2rYnXyNg+7wGQ/s+o6vwHCdaMg==
X-Received: by 2002:a05:6000:2084:b0:475:f0f0:9ec9 with SMTP id
 ffacd0b85a97d-47f6233b524mr4775540f8f.52.1784306808570; Fri, 17 Jul 2026
 09:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085151.22822-1-jiahao.kernel@gmail.com> <20260717085151.22822-3-jiahao.kernel@gmail.com>
In-Reply-To: <20260717085151.22822-3-jiahao.kernel@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 17 Jul 2026 09:46:36 -0700
X-Gm-Features: AUfX_mwqJ6k9K8CILsmY533tK_ILpfzrDWmeuk_O0N-L0gFYxxQq9ITENfNpP6k
Message-ID: <CAKEwX=NEevkKu9f1Bji2j9pGSHJkEPugQ8fp7gmUz5p8KpSOMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 1:52=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> From: Hao Jia <jiahao1@lixiang.com>
>
> Currently, shrink_memcg() writes back at most one entry per-node during
> its traversal. This makes shrink_worker() inefficient, as it must
> repeatedly re-enter shrink_memcg() to make any substantial progress.
> Under high memory pressure, this can cause the writeback speed to be
> too slow to keep up with refaults, leading to zswap store failures and
> forcing pages to skip zswap and go directly to disk, which results in
> an LRU inversion.
>
> To address this, extend shrink_memcg() and rewrite its LRU iteration logi=
c
> to support batch writeback. Introduce the nr_to_scan parameter to bound h=
ow
> many pages are scanned per call. This enables batch writeback in the
> shrink_worker() path, while maintaining a low scan budget in the
> zswap_store() path.
>
> Test Setup:
> - Total memory: 32 GB.
> - zswap settings: max_pool_percent=3D1, accept_threshold_percent=3D50,
>   shrinker_enabled=3DN.
>
> Test Case 1:
> Allocate 512MB of anonymous pages and fill them with random data (to avoi=
d
> compression), then use cgroup memory.reclaim to force a large amount of
> anonymous pages into zswap. At an interval of 2ms, allocate a 4K anonymou=
s
> page where the first 4 bytes are random numbers and the rest are zeros, a=
nd
> then trigger a reclamation of this 4K anonymous page through cgroup
> memory.reclaim. When the pool threshold is reached, shrink_memcg() will
> be triggered.
> The test data after running for 120s is as follows:
>                                 Baseline       Patched
> shrink_worker wakeups              5,363            85
> shrink_memcg calls            11,373,201       180,928
> written_back pages                40,212        40,236
> zswap_store calls                161,190       168,741
>    store succeeded (ret=3D1)       102,743       127,644
>    store rejected (ret=3D0)         58,447        41,097
>    store reject rate                ~36%          ~24%
> pool_limit_hit delta              55,826        14,062
> pswpout                           98,659        81,333
> pswpin                                 2             1
>
> Test Case 2:
> To consistently force zswap store failures and trigger shrink_worker(),
> the following stress-ng command was run for 120 seconds within a cgroup
> limited to a memory.max of 1G:
>    bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
>    exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-set -t =
\
> 120s -q'
> The test data after running for 120s is as follows:
>                                 Baseline       Patched
> shrink_worker wakeups              5,640           987
> shrink_memcg calls             8,481,500     2,504,818
> written_back pages                   260       768,576
> zswap_store calls              2,742,756     2,301,414
>    store succeeded (ret=3D1)       934,640     1,308,686
>    store rejected (ret=3D0)      1,808,116       992,728
>    store reject rate                ~66%          ~43%
> pool_limit_hit delta           1,181,310       101,593
> pswpout                        1,808,376     1,761,304
> pswpin                         4,288,497     3,902,658
>

Acked-by: Nhat Pham <nphamcs@gmail.com>
