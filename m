Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071236;
	b=jCULzpZxcm+D0/cqLVW4VepEuCDJrufvII0SLzmUMnrdhyWGK60uoQtX1efoT1fR6g0C
	 NskEGNOm6MPpSzh1r4nWdQCx50xwhKI/rgseZmehqfSMKP/+kL+D7A3bDN/lA9FVIInqk
	 t1zWgdcFuwNg25ymOKfWSJn31PSSCnj86qKAD4DWkbI4lCbd3mj343KBuPVzzGJ9HOEXL
	 5/I34Eu+OxjFNoowbv/vgJYTW+ipC5Or86xZ2ma6LfV9im4vrbdTKqSas3pY1uioOW3rB
	 +n7ZkBeRgpKkD4XIak+hKERdLq6ZOc8/CrC/ezgyyqeiweEoJAjk9Pi2jjH5aocsYug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GNJE6UZ1rBDrjDiT/mTO/LT/Bdfa8O3VHkLcxkHxptk=;
	b=yuuX7nN0w5vT3yrEb7QZhTE9RQrP8Nwt68NNLO64LSl8DJ/KwEtg8imZri4adOcmYmFm
	 2e9QaLn4xruoGCRXZucPU2TBOgT5SpRdCT+zF9m3MH28kGAqXJi0veRsv5sAAPZtuLiCo
	 E0OW13I5UTqRPGo2JdJyS+RfY91pMVV1oOzswp0lODswTCQT1e5XcUTxqChH7HkYwOXiw
	 xX2Kkp/9Bb8aD8Z82d2YIhF3yH341YbLE8CguAi/Omsekg74dXhWpZe8v9PAkRU6eoa5W
	 RG/9Yi2F7P5hrpTkBoJMLBRiEboF2Qc2ep4eAO4hA9iwFXTiaaE02RsUidm962c4rew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Y0qoLWEj;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BEB606A320
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 06:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66BEB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Y0qoLWEj
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ece3ab2e91so663253e0c.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 22:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795071235; x=1795676035; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GNJE6UZ1rBDrjDiT/mTO/LT/Bdfa8O3VHkLcxkHxptk=;
        b=Y0qoLWEjh83JR2RiA/QkN9X7Bza/6m215iROBPLHo2IkpTTLdbUvdTEU1IFsPjmB1w
         2tA6VG52XjM7z/pfKqvG+CFJIC0zhfwOe3+VEGJN1rpAgI6QBhtMIDjVfxMuC1HhfdU0
         s8QRqSx98vUBJZ1GMoi/0eqk+7cTDbBEuWwG5aUFAvF7KvHRv062dxpMH6Ek6zRI01lb
         y4igS/hLwj9yVnEH0ceJxSihwKhybrd3WVkvNNYag+MzEMAEtDpfQxrJo778EMdzRwyR
         1EvKWtrMQuHW9CO73NhiCHRqRa8lWZxGUhzOw9UnsNTPl7/FW/w/A9Npr3U0b1seNzNp
         0XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071235; x=1795676035;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNJE6UZ1rBDrjDiT/mTO/LT/Bdfa8O3VHkLcxkHxptk=;
        b=b7X3AEQtRlCWiPTqiq9MTsMn3lMBxak16tMp26aqR7fvXdFWLPXixBSB/rr4Bgj+NL
         gEm3WJ50msHzsoL2nXdisB50XZzRDDD6xZNlHUSg2vtxhd/Gw8ejvAFAUcZKBlBCJA22
         j0SlQJR3IlipHAnlbuthpDGVuGxzn7qRP/ZKln3D1DDInfEusRrQFJRCWjvbhE40hzXe
         CKVHCrBnjQt3TKeV25xQVGBUXhdSnZZ/hVXivIhdhP6BHLzdoiZBmvbB0TXsmExOO49s
         RNRDY9biQK3iKkCek9slCAKDpwP5Z8lvJcbqLEpbJ/PA0cZ91Phb6+1Y2gAK/Vo/2y01
         mSSQ==
X-Forwarded-Encrypted: i=1; AL+hErGoihn7cbRO/7AhPbja3lcXiQRVSZt6mPFk3Si1g2IL5Dpml8HvrZoYyOtFny3G7dVTngmQGunIabQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YYkZFqTQ0i7ziE3zr1NXKezHqxyfFWHIgnGXSZtTAbJ8OAI3S
	47ctzuOU1dF2pjUFTASarHQ2v1HEtpJfHUWYgY/K6GuaFOpxQT7nS6Q6Vf9umcBaktw=
X-Gm-Gg: AYBFou1OME0q06w5maEPx5gLC1aZDOrJgBRLNycuYklTFoz7WuNl5PluEJE/rbe+W32
	qnITMA86zoKMfOsGnBHZy7ep0p61Tsqg8RgUrU4Xuu4RKSMsszb4yvnyWhTfi4LJnCD92Rjj6Pu
	mrLDmTE/0/xcQeTBruO4oYqjO9xGN2j7laaXeSOBwf1t5tflaBEdQLSin0vaA5Ul4zFvca89av3
	q7rRAqRONXi/Hq/1FCRZk+VG16vtGFZbKD8ul139jfZ0YAzGQX3OmcXY7C9PkAIMkwT736hVssh
	n25xZpUQ5mmlANUrlheWg9E74xdlUubEiRAEjtUk0CqK1rka9wc78i0pUAFMhXE9Us5vrrmzHuK
	+kWJcYMhCDAgOGokEzR7MpMdGmCaULYqSZVhaqRUdUr7ZikIbtV9Fzr+Ytg1fnL/pWtu/LwnjLb
	VH1+tEyP862QlfbQwAnROZZvwp7I6T4Up6oNJje3vNGU6OliuSCXNSD/Jv+QSZsZ5ZAY5kzeTj7
	u2NAsv82jgu6akdH9mH04a67U61R6BOIFrWzMm6nxCEk3eGxZF9q9ESPCiYEhuvahFdcKR6H7mM
	5UbLzjS+6dtogtfnVNgM3VMqEZLEhMZtXXh28a0j0YWqytsVdFOB0FtlDtwfC3dYZOesB4wGfEU
	71cMRu0M02whn6YJZ70babrnJcoBmK/oEfBzaoDCdei1m3xM=
X-Received: by 2002:a05:6122:62a6:b0:5ec:c162:d58c with SMTP id 71dfb90a1353d-5ee646c8d94mr2473939e0c.9.1795071235328;
        Wed, 18 Nov 2026 22:53:55 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64ed7adesm3423790e0c.15.2026.11.18.22.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:53:54 -0800 (PST)
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
Subject: Re: [PATCH v2 0/2] kho: drop the incoming sub-blob debugfs view
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Long Wei <longwei27@huawei.com>
Cc: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
 akpm@linux-foundation.org, graf@amazon.com, leitao@debian.org, 
 corbet@lwn.net, rdunlap@infradead.org, linux-mm@kvack.org, 
 kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, hewenliang4@huawei.com
In-Reply-To: <20261119063800.698863-1-longwei27@huawei.com>
References: <20261117092951.4017931-1-longwei27@huawei.com>
 <20261119063800.698863-1-longwei27@huawei.com>
Date: Thu, 19 Nov 2026 01:53:51 -0500
Message-Id: <179507123198.250261.1844561072152549258.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=693;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=yPAAYOBOOObp5DgeME+PxCgH3xqwEnbp1bk4PDjGg1w=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq/p0CnroMuBFG1w6cbj8X59tE5O5lJneO9MDj4
 lpdbHwN/SmJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCav6dAgAKCRC7dyhM23N6
 3ueZD/9IfpTbNdfM3QFnBSJ+zx3bm2JxD9dV5H5hWe+Gjsh41ZGlB0WnSHEX20Rmk1d5abeMW84
 YuOO5K7r5GSkJRKMvTTacqC2gsAKNdfqmQNE9Ga0TsIUx6HiAtnkCtLw9uR02oz172xoJc4mvO9
 +ZqbgXBHRsVLRs+xIhbKLtgRupLeYNRefvdLlgfYjdO/EvqrXKsRlsp/0kW3yaffoQAvKCsNdmW
 16aMO3CiHE6yaQAN1D3oUdn/8llK8liHPsRBBs0apFi9EfuYvH8w9AdgiNOldeInZFxG3pQ5lt2
 J68ik5kvSGmYv3otuVVHATIhtPCzpFkefbI6TnzDmHQjsOyfAdoBeT+rr7RokoIs40ggiuZWDxA
 zLnpfdyvxylfTyeKBueMX8Ld3bqo8AIIqtoVhuzYNZty9jqG8zbl7FhUCJoAvQXKPlhHUFnwY6G
 HCYj3jsg8dYK/WsOI2Gu4v5CPjLTrlGW5oUPQtaQSzsnt/zLFKTt7EFH9XVT3Zb1ABU4Tdox8Y+
 suCeKE//fMBGowWddh1UZUiThSoAVyasPp/hW3v3sYoZlglqjIdYx9ky+DoCaGj19wrMNL2nFIF
 mY1HnMljaNI4FLF36QYmGhdJvoHC/SNewPtz4kM6nVlGQZym6+GFPOWHPmDV+ClJcKQUMi5Q2kD
 hQHgp+HNhpEYXww==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Thu, 19 Nov 2026 14:37:58 +0800, Long Wei <longwei27@huawei.com> wrote:
> kho: drop the incoming sub-blob debugfs view
> 
> kho/in/sub_fdts exposes the raw contents of the sub-blobs described by
> the incoming KHO FDT.  KHO does not own those pages: they belong to the
> producers' consumers and have independent lifetimes.  LUO, for example,
> restores and frees its state in early_initcall, before kho_init()
> (fs_initcall) creates the debugfs view, so the blobs point at pages that
> are already back in the buddy allocator.  Reading them triggers a KASAN
> use-after-free in _copy_to_user().
> 
> [...]

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

