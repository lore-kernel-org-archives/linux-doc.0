Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219829;
	b=GOFDWL2yoF40SDt7jhgU9yFg/wXHUkYgW42Kuxea6FCgPAeo1xeuplMUdhl+ihYJ4FU8
	 l8gLJ6X4Az9uob6VeiWusX01LWNzth8s9zk1dGzW4ej8G02M2NQyE8XDPdf3RmCWg3S1+
	 1eAQYVxy/V/+tCZs1/v7pLqfIOfabio9C9DpF9rrH0yjmq3fgTNwnPTHNuP3Ed2oVNgzz
	 ySlR8H2WO7OcmigkpizpyVduPcK2GjonLEWavytosU9iqPj0D0OKvAhW5HxZgQjVV5vBN
	 MhrFEgmt6n9DyFkUXbJp/E3awW66v4ewTZIAQp3JygmIuU8kS+V33u/FTn7WtBbyedw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GOkZMWndE8pvmQEZjLf6QfLtdr6Oc875cvI2O5RWo1A=;
	b=iEJvQBh3HgwF8BxfmKlsjRKBia6uClnwguAWsXuWDs6aMbGAI8eL0lZbbZyLiVw/klnv
	 UKeIByjniC6y9wt5eQOszzbcBoVkO836NUG3HT9DKQEpSSM4cmzlZWrIZLAKR8LBpYVbm
	 z3HGTZdyoJwWKBzLZlAaj7cNTBd+JyYCbNgBUjZv3y6H8vqP9eYlm4QynZpNMRw/XQINm
	 YEkOB17Pygz4UWN9zC5VPnAgEh6PPL9sg7/T4ev41A/u+wNzL8fEghj+MnYp9B7N6gkss
	 j6CXX8ndup8PQtJaNA9xvGtZb7mmU3jTfnj7Cmk0/k30kbKfn597q/LfBvwOHPjvryA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TAe25ahd;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410CB606A326
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 20:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 410CB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=TAe25ahd
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so1195753e0c.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 13:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793219828; x=1793824628; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GOkZMWndE8pvmQEZjLf6QfLtdr6Oc875cvI2O5RWo1A=;
        b=TAe25ahduDUoJ2Df6GDNj6g1K0GNDwadJWeM9d71dY/Kg5P//CUMBBiOUzh/f8q+w0
         jUSNhyns6i9PCiLzpb/4IXdowNQQUHmS1qSsD3ecdiF3VVlGvSeV/z0FOBXURzQ5QXiy
         m+Z5HXCcuE7UFKf7f7v3yMdyY+oYc2VMbqihp72ccXvnl2b8bR+lVLt4GqxD/dqqOzoc
         0478O12Gs0Dcvk00suElhRNVZUabVIC6ugsV3JAcOgBHb4hADNbxbh0B/TdQ4NPOVG7q
         OjVFcT0YHK9S87uEjGAsbkclhOKFuxhegC5AW8Xeqj+Mp6VEQzS/0MMLFcw7O2I/Qkl2
         6TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219828; x=1793824628;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOkZMWndE8pvmQEZjLf6QfLtdr6Oc875cvI2O5RWo1A=;
        b=LMt+52/p7SRfRmcQR/ZtCtx3xmv2EGgUqdz0q5c1GjX/58xt52glR0WpsPycsmxyE+
         yqNlNRdhT9xUIKDRFB9q4iVQQkH9OlqBC6EXhZTeTKLLfwuBFeiT/plxkCpY6RQUHc9f
         ACQVNzz/km2qbThP6JDBltg8SU1pu1j5fSHILIvBIq9lvbp+a5kHQ6pUdAtb9D2NNQod
         3XdiZ0M+rZ1OxXJ75ZHQ/hDR7nbXkYtGH33bkcyCKI+ZJWXIdSKTiAVJeoCpwZR6OTpJ
         MS1klKs7beUTzSNh2INtIfHj8APtPCdlPj9uwp/DHdT6xoUsnCCvXB0TVJVrjg0KvOP4
         ZMaw==
X-Forwarded-Encrypted: i=1; AKwUvBxQcYuhRyf1Ey1iUfKhJE+tcZit3bp3ij/YS6CzrRP7JHQnqkLND7+UD91ii7IQf2L6n/Y7y3+A0HI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA0vYtXe6/Gs/Uf8fW/7iEtA9+yKCpI9DU8TNgxGSgr2U3lfM5
	9s/Sd8EwBWkm/DkHN/sNp1Foq/1u/aYyzYcvIoiaxxB3xj2C/Fp+wUE8GzMcWSKLkZQ=
X-Gm-Gg: AYBFou1MFGWOVVGnTZGFLWdgmUFVmBD2HLWQGkJZKfL1VAGF1dIO8NRf6N717mT6G+z
	pOVMauqbgyNnuFqMbjJb9rJo/TnQi3Suqp9uzsPD9GNy6Vcp3+8TFi/9ldgBIHY4svGstJCDXJ8
	5QaATOmtZ8CstfxsFiuEeGy/m0HNQ6VSjpsC2r34kcC8V1MMZpu2s7G3ZGhkaO9U3d06HYxck8e
	WT6b9tkq73RGLLcKoeFn5MxEDfcOnwtX2MxGvFZlm9ZDr9S3W9VE+AUTrFb0/x5jySzYu0U17O+
	0T1aWYBtgelByy0oglxXwC7hFpYCQSFiFDuXqxtGvuNfOd//z84bgzNyZtt6hB72Khhfy48KkQo
	IqyRvWsrq1xE6ZK8FYEO59CYSBC7pEWWq/ZdRNvq3StQUZVqbn4kh1a2kuuDzNMeCIiRTbZ3Pbv
	KcIRFJWsRn7jurF+fF6Wbw17XZhMKmRFH/8L/11/R0ieVP4IndgG2P6y+AXXZSAehwvXCxv4n26
	TfRc7BnkUxxqNuMR+pvyl3DU00s0EPbVbUIPTV1TTyoKoJDDv7qTs8B+6lbScRcuuaqDB/sOF7a
	4FAM8WhPcG55MNVa51HfGqLUvJETXbNV3lWbb2Oc2ypxbFLOLFGTP42MTTrYhT/bdY96ULN0hiu
	D0zkyyi41gxpiUQb+Rjfg3XqV55P/tKN5YC9tzLvUg6ae
X-Received: by 2002:a05:6122:e146:b0:5ea:aedd:6087 with SMTP id 71dfb90a1353d-5ec4cc275f7mr2103697e0c.4.1793219828216;
        Wed, 28 Oct 2026 13:37:08 -0700 (PDT)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f931911sm3001789e0c.10.2026.10.28.13.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:37:07 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 06/10] mm/shmem_luo: Don't make early retrieve
 failures permanent
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Christian Brauner <brauner@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261022225035.377445-7-dmatlack@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-7-dmatlack@google.com>
Date: Wed, 28 Oct 2026 16:36:59 -0400
Message-Id: <179321981903.1894369.10174219200491856665.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3851;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=tG1lwbJH2imddc9/EkdAvCrAH3EsxAEhBkg3bvhE7pU=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq4lzu/Ke5JngGl45TFenDqO7sG2rxu1esqb+GP
 W9djlMo20SJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCauJc7gAKCRC7dyhM23N6
 3iaED/9+Ua/XelfQOiEDcPhs+IpN2Oer+RtBy5oWFs3Ld85ncxpkokj4M4S+zrCda7T6eqJ99qt
 WLFndguG8lw6lCfX6vMRTCE9OvLMPJBZgk++IOWd8vMSMo6sJuHC2aIVh3oiJGQbplm8A1pHtUd
 vK6/sqWNP+mqdoADa7IlEmu7uydtPZQ6gVUtj2oUDU/YZzfGVeoNe5EpResTvkYk6Vdp1neLYfh
 lGFsCCrjbH7TCtTThMrEBPQ4JJlJ1/OFqdkCwFpq+cdyUtErBGUGLeK2rxFf07U8U/ydQn4SZUM
 WENbDKA0F1DjRR8/sx7kedrfcj9vWP2vd3hFY+cEsyTLawSybRQS3QTUa+gEJtOXZPjHosBrYLV
 SgvOrjrbhjAv0oaxXMYRWWKgn64IPRbOdPvQ4F/QszjMPjkReBEjjmQFtsspuKgQddk58EUwpqT
 4ngiCEIpWUObRZBvgLFJYKOfdLl0q15dVVsk2n07fF0Neb1UD5cKlw/weF8lT3q6GuTXbsMyJum
 A4XQ+dpSI5XTmQAxL/tylp3fhJLTkVqQo9jG9GkfeVltDyl5rgMWOELBqk40kb4LfCQGwzLL4Hl
 lFLQ2ewQ3dOcxeCNM8ZEEzGZDPFihhVjKt13uUjJSoCIYziR5ctZUkisBrVjd+w69E7fYLFUC0e
 eLmLu3ergMn5ALQ==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> If shmem_luo_retrieve() fails before it starts restoring the folios,
> mark the failure as retryable and return the error without freeing the
> serialized state. Nothing has consumed the preserved state at that
> point, so the retrieve can be tried again. If no retrieve succeeds,
> finish() frees the preserved folios, like it does for a file that was
> never retrieved.
> 
> This fixes leaking the preserved folios when one of these early steps
> fails, e.g. because the file has seals that this kernel doesn't support.
> The retrieve freed the serialized state but not the folios, and finish()
> then skipped the file because its retrieve had failed.

You should also note that args->retryable was introduced in this 
series, so there is no fixup required for this since this was 
previously not possible.

> Assisted-by: LLM
> Signed-off-by: David Matlack <dmatlack@google.com>
> Link: https://patch.msgid.link/20261022225035.377445-7-dmatlack@google.com
>
> diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
> index b8d86055912d..bcac1bbb3db3 100644
> --- a/mm/shmem_luo.c
> +++ b/mm/shmem_luo.c
> @@ -390,9 +390,9 @@ static void shmem_luo_finish(struct liveupdate_file_op_args *args)
>  	struct shmem_luo_ser *ser;
>  
>  	/*
> -	 * If retrieve was successful, nothing to do. If it failed, retrieve()
> -	 * already cleaned up everything it could. So nothing to do there
> -	 * either. Only need to clean up when retrieve was not called.
> +	 * If retrieve was successful, nothing to do. If it failed permanently,
> +	 * retrieve() already cleaned up everything it could. So nothing to do
> +	 * there either. Only need to clean up when the file was not retrieved.
>  	 */
>  	if (args->retrieve_status)
>  		return;
> @@ -526,11 +526,16 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
>  	if (!ser)
>  		return -EINVAL;
>  
> +	/*
> +	 * Nothing has consumed the preserved state until the folios are
> +	 * restored below, so failures before that can be retried. If no
> +	 * retrieve succeeds, finish() frees the preserved state.
> +	 */
> +	args->retryable = true;
> +
>  	/* Make sure the file only has seals supported by this version. */
> -	if (ser->seals & ~SHMEM_LUO_ALL_SEALS) {
> -		err = -EOPNOTSUPP;
> -		goto free_ser;
> -	}
> +	if (ser->seals & ~SHMEM_LUO_ALL_SEALS)
> +		return -EOPNOTSUPP;
>  
>  	/*
>  	 * The seals are preserved. Allow sealing here so they can be added
> @@ -539,8 +544,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
>  	file = memfd_alloc_file("", MFD_ALLOW_SEALING);
>  	if (IS_ERR(file)) {
>  		pr_err("failed to setup file: %pe\n", file);
> -		err = PTR_ERR(file);
> -		goto free_ser;
> +		return PTR_ERR(file);
>  	}
>  
>  	err = memfd_add_seals(file, ser->seals);
> @@ -552,17 +556,20 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
>  	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
>  	i_size_write(file_inode(file), ser->size);
>  
> +	/* The preserved state is consumed from here on. */
> +	args->retryable = false;
> +
>  	if (ser->nr_folios) {
>  		folios_ser = kho_restore_vmalloc(&ser->folios);
>  		if (!folios_ser) {
>  			err = -EINVAL;
> -			goto put_file;
> +			goto free_ser;
>  		}
>  
>  		err = shmem_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
>  		vfree(folios_ser);
>  		if (err)
> -			goto put_file;
> +			goto free_ser;
>  	}
>  
>  	args->file = file;
> @@ -570,10 +577,10 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
>  
>  	return 0;
>  
> -put_file:
> -	fput(file);
>  free_ser:
>  	kho_restore_free(ser);
> +put_file:
> +	fput(file);
>  	return err;
>  }
>  

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
