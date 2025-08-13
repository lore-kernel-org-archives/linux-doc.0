Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477052D238C
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755066886; cv=none; b=CoAVsYCnc5KMikm3IiE5cPdNNR9QiauNFTbBW8hYbmbaJrGsapnAm4VF2zl08zjE2C2yAvFLE+p3s6Lmu2MdbgnxCmCjbYmJYHei2ZD0i71NelTCQI+29D/Kg0cYX0/6C8Xie6EkgSIhnsgQ77OI6gTC1KwWMCPIHlRxBcMK5YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755066886; c=relaxed/simple;
	bh=QnD42qcFxdQmw5Rdxw3IWpBHxe/eMag57tc2qEN9NFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsZv4tjONh159QbYrz76UW9W47x+pKQWSrKipavpKqV4vTsX9UWC6+Z1Kma5vvW4uX/38W57RgBmfcOohHUlnrVxAjLQS1aiQ4xBL/j9G8p3IYwdu+sJSS2O60TxlWVrowzkCIXk+IF1Ht5fG74li7iI/+aSEYkIKLP+8l9PCH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LmdalF4+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LmdalF4+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-242d3be6484so77385ad.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755066883; x=1755671683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lBz0ZD/446lYgybbXFehAqqU9nULcqKZHue50p4Cg4E=;
        b=LmdalF4+Xw6sd67w7kK6jpC5AMPxVqlMSoK3VA0cHd4z487+feM82OX2+fio6RcOQI
         aMA9rJy1LvZYDsOQhFbukl57iNew5vh8yirvg/Eji+cTT8hRWsGN0NgO5qWDGb7R2jkV
         269fnapyIHbLquCGOPa8pc5i99Qkez2iSHuZ+iaZ0UbDoypnWCj4LY6ZNUqwsVbNR5g0
         oKGiVfrqHrgP/ZFZENH8gHMQrw+SMoBA1cRLApGgCfKoysEMLiHc24XXsR199ob3qxtA
         5jtKErkudTCWpxxrAOTiiJOy/ceKhw51LoqBPNU5/5dYhW0yEEdKHCpwRcfPo3IbOE2z
         RpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755066883; x=1755671683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBz0ZD/446lYgybbXFehAqqU9nULcqKZHue50p4Cg4E=;
        b=mqJryT4dm5Gps4Iv/n8eaTIWrYMRznHmbk8ALzFciEU0bPPsUpBqfQtzUsh1qa48gJ
         O73HprZq+R4b5UjvgQn1oAHDHqf7sbW6ZnIBYUbBRQJ18isVe2WTlpMWC4oswFgYJ1DK
         EisiVfTXExuWFMh3a2FSNMnOaZkZi+xgPpaBXykVRyF9/Znu8VQX2Cw9fEBxc3pCur/i
         dc75L1HasI1mmjrtJ8soNpkMpLW+azNIklYamYjq4ES/qj9rMBj2LsV1vCrtso8bZEcH
         AEsrJnDuejUqLqvoajL5pS9fxzp4UwnxTJXngCPCIVNfnU4kfnAyq911uPLF1Tfn4nkb
         dlTg==
X-Forwarded-Encrypted: i=1; AJvYcCURSCU9kCBpgIMUGoD+xUg/5NzdWctGAzC613+2/4hZ8fSU9dde8lI8KnuNbxqxz7c9prKAl/0AIJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmgTxuiWtDKclCnO0zJG9AYzmJfXEtsn1QyZLmWxhEZKQXnygg
	NpEDgVtyFkNiC0BmYGpWIkDmzG4LwnT0HVEE2e69ifiIAQ81yxDCNwtqfk6kpqRaMw==
X-Gm-Gg: ASbGncvjMPg4GI0nzrUoFo63gO/xPxa0ryyTWldeHGr8sY4EaO0ZEZUG8Im/pQ9uKnu
	dJIlElapgeFl5Jk0sgcn22OThMH0M6tY8Q7wOrEvre/1ZvnUYHsJjmmR/Fl3JFHcGeQeE0cU67/
	FM3q1Z6Lf1UfySyZfiX2+hoNZkeh5RAVIFe7PMl0TQrx70VeEDMPcetLU3uh4bE3HiYK8OLd6OY
	P9JFjKKfhmsNG9oZUyz3pjCXlcxzz4kvrL0IuKOqrl8dPEyfteNoE7h9jHBcI28lOIIoT5jhntB
	bECWsCiXWOQ3QCIzKWVWyC5IoRqbMVRZXEPa3sKAxx0EDBP3GGux8S65o5GR6eBJEO3Os9Txpdf
	TJBYJ/za0Wx4ZBqrWReM+vrs8mhXuHkrWWx0UxuKhpRr4T0hlTtc4qlTrdjyJI4tFfSw=
X-Google-Smtp-Source: AGHT+IGFb0xX7B2Q6MyY6rFw3BXv1hxo5YhlKW11olCnEO5GfmzQ9WNDztxD1sYVpPXUsxAdW3d/ig==
X-Received: by 2002:a17:902:e746:b0:240:6076:20cd with SMTP id d9443c01a7336-2430e55bb17mr2238135ad.15.1755066883155;
        Tue, 12 Aug 2025 23:34:43 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24303d5e705sm30477375ad.14.2025.08.12.23.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:34:42 -0700 (PDT)
Date: Tue, 12 Aug 2025 23:34:37 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com,
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com,
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com,
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org,
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr,
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com,
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com,
	vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net,
	brauner@kernel.org, linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, saeedm@nvidia.com,
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com,
	leonro@nvidia.com, witu@nvidia.com
Subject: Re: [PATCH v3 29/30] luo: allow preserving memfd
Message-ID: <20250813063407.GA3182745.vipinsh@google.com>
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-30-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807014442.3829950-30-pasha.tatashin@soleen.com>

On 2025-08-07 01:44:35, Pasha Tatashin wrote:
> From: Pratyush Yadav <ptyadav@amazon.de>
> +static void memfd_luo_unpreserve_folios(const struct memfd_luo_preserved_folio *pfolios,
> +					unsigned int nr_folios)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nr_folios; i++) {
> +		const struct memfd_luo_preserved_folio *pfolio = &pfolios[i];
> +		struct folio *folio;
> +
> +		if (!pfolio->foliodesc)
> +			continue;
> +
> +		folio = pfn_folio(PRESERVED_FOLIO_PFN(pfolio->foliodesc));
> +
> +		kho_unpreserve_folio(folio);

This one is missing WARN_ON_ONCE() similar to the one in
memfd_luo_preserve_folios().

> +		unpin_folio(folio);
> +	}
> +}
> +
> +static void *memfd_luo_create_fdt(unsigned long size)
> +{
> +	unsigned int order = get_order(size);
> +	struct folio *fdt_folio;
> +	int err = 0;
> +	void *fdt;
> +
> +	if (order > MAX_PAGE_ORDER)
> +		return NULL;
> +
> +	fdt_folio = folio_alloc(GFP_KERNEL, order);

__GFP_ZERO should also be used here. Otherwise this can lead to
unintentional passing of old kernel memory.

> +static int memfd_luo_prepare(struct liveupdate_file_handler *handler,
> +			     struct file *file, u64 *data)
> +{
> +	struct memfd_luo_preserved_folio *preserved_folios;
> +	struct inode *inode = file_inode(file);
> +	unsigned int max_folios, nr_folios = 0;
> +	int err = 0, preserved_size;
> +	struct folio **folios;
> +	long size, nr_pinned;
> +	pgoff_t offset;
> +	void *fdt;
> +	u64 pos;
> +
> +	if (WARN_ON_ONCE(!shmem_file(file)))
> +		return -EINVAL;

This one is only check for shmem_file, whereas in
memfd_luo_can_preserve() there is check for inode->i_nlink also. Is that
not needed here?

> +
> +	inode_lock(inode);
> +	shmem_i_mapping_freeze(inode, true);
> +
> +	size = i_size_read(inode);
> +	if ((PAGE_ALIGN(size) / PAGE_SIZE) > UINT_MAX) {
> +		err = -E2BIG;
> +		goto err_unlock;
> +	}
> +
> +	/*
> +	 * Guess the number of folios based on inode size. Real number might end
> +	 * up being smaller if there are higher order folios.
> +	 */
> +	max_folios = PAGE_ALIGN(size) / PAGE_SIZE;
> +	folios = kvmalloc_array(max_folios, sizeof(*folios), GFP_KERNEL);

__GFP_ZERO?

> +static int memfd_luo_freeze(struct liveupdate_file_handler *handler,
> +			    struct file *file, u64 *data)
> +{
> +	u64 pos = file->f_pos;
> +	void *fdt;
> +	int err;
> +
> +	if (WARN_ON_ONCE(!*data))
> +		return -EINVAL;
> +
> +	fdt = phys_to_virt(*data);
> +
> +	/*
> +	 * The pos or size might have changed since prepare. Everything else
> +	 * stays the same.
> +	 */
> +	err = fdt_setprop(fdt, 0, "pos", &pos, sizeof(pos));
> +	if (err)
> +		return err;

Comment is talking about pos and size but code is only updating pos. 

> +static int memfd_luo_retrieve(struct liveupdate_file_handler *handler, u64 data,
> +			      struct file **file_p)
> +{
> +	const struct memfd_luo_preserved_folio *pfolios;
> +	int nr_pfolios, len, ret = 0, i = 0;
> +	struct address_space *mapping;
> +	struct folio *folio, *fdt_folio;
> +	const u64 *pos, *size;
> +	struct inode *inode;
> +	struct file *file;
> +	const void *fdt;
> +
> +	fdt_folio = memfd_luo_get_fdt(data);
> +	if (!fdt_folio)
> +		return -ENOENT;
> +
> +	fdt = page_to_virt(folio_page(fdt_folio, 0));
> +
> +	pfolios = fdt_getprop(fdt, 0, "folios", &len);
> +	if (!pfolios || len % sizeof(*pfolios)) {
> +		pr_err("invalid 'folios' property\n");

Print should clearly state that error is because fields is not found or
len is not multiple of sizeof(*pfolios).

