Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC78F37F748
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 22:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711456; cv=none; b=lPHxgnf07j0Z+MU+UCEUH549PaRz81giPAT/QrHiNr5neYu7txFSC0w5dm6P/uCUbpzzV+Wz4Ho4FzEpLQkGJ3f7Mryzkl1rbQJgXWzjLqAkZU31SVXtsNsROrR0rxQt/5LYSDi1ypDYyAJWvL0vXQYUedm/8zo7Kn24dEqLKDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711456; c=relaxed/simple;
	bh=BdzeFnM94A7uHGNdIfZzoHy38lcfwYKhB0qbIcZ+fXU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=knQX8GVDj7CFWXXiISaGzye+z0i4xnpEqo4wSxSZcrhSu1cooWKVBMdw7yybi9UIi/JNDIwoFcnj889Gsv3zjCAsdRGM0L7Hy6c1yDZcy62bKWMVGIMRLaabw+WNrpyArRJf+TsuUSMHOoQkB89WX/mvBrlZ48Ldb+80HJzkUSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfe8pbjd; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfe8pbjd"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-132c338a537so3243707c88.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 15:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778711454; x=1779316254; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BdzeFnM94A7uHGNdIfZzoHy38lcfwYKhB0qbIcZ+fXU=;
        b=bfe8pbjdwGpPsFP/YbR9x7OV4+uaG07u4svh8xJxDLAJUS2cxfJC15ZO17zAp8fIS+
         RXFR3vaeB1GGA99jy8+Tx98iGZNkS5xeJx98nVyw/tvAdzJEl9DFIHj2dlqspo7k7OBj
         Hc7MPMwmaJU6fm/ToWKUrOkykmlOQ0GCt+qPz76Nwejw+HL34wZLBSJu94AK9DT+boW3
         HjP+w7Yq+hkPb0JVMD0oPu638TTNpNpIfmrIHVDib+t3DRVN9VD4jMQtThr8OuJegbVa
         qd9S8or9rPFMb0sjPDdYb4R4tf+jtX7a0BVRx7PSw05tjMt88Vzld/jn3MvqFLiMamIg
         qzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778711454; x=1779316254;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdzeFnM94A7uHGNdIfZzoHy38lcfwYKhB0qbIcZ+fXU=;
        b=Z53b2oKgj8GGyRMoAHuD4J55QVNIO0MGJ0FLKXdBj5pI67GoB2FzGGECM+VDrWRkBQ
         u8+B+Fcj++ZObv2owZxSpYg5IzYF0FB6jNpMv3cfs+zYcjtavZzpHQYICnA5ads283z0
         U3ZG8Vyc6MiyZSpJF1fVNXeK6EH8KmF/iMOUc/htSw2xaVOWMkY2n4KU1bJcIoIgq21v
         3fXb+Y3EvZlFrnBz9i1Of3ciJdFT9onrSkfdvJHW5c1IZ8LaT4dexXxQ4WjIZXuj7/ct
         iILMbCyqrrlasXMaEyoSyYeMAiQ1fKhtV6d8leP4WdkQN10jTBDIr0qyCbEUTaPtWZp7
         ikrA==
X-Forwarded-Encrypted: i=1; AFNElJ8Iy3rOMaG1ZLaG2MzwKSJJj7ybIyg4p7MrnhifYqTYGEym7bYAf5P+WXn5/7PNCeMsI3prbh7TUp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLndjxZDXgra3r451guRKN+/esdZBvKLe71rx7MGfvVxFdQEe6
	hqUyr2A2QA17DFa9a4LpPKF6sZD5RNCXOZWlsrR+G7WyPePav6ho3UGM0CrCC4Kj
X-Gm-Gg: Acq92OHbnoUD/LZ7qA0v1t/nPZYREimPtvk8B7u8HZr+YjYKDp6QI9KsebzEITxDBhF
	5C0NRtrhY0x9PcRvpYLHMLySnO1B0orPTPJ1+XXRoW8E2AVe3PWB18DvJGuwlFntrkG+NFV696Y
	PveCPWyD2CgbxQ8z6dExQHdb4QqBU6g699CrmwOL30xkEenWtP9rR9YLak6ew4IQnM6rqTePSbE
	I7Hq9OZcIcy4uef2D422WhFzr+eCVq/h97Z89aF6fDbeuv06JxQ4670xRgpaqoy30mlBA5W42b6
	DAEWlRmjEUZHSZCFzj7AixNjdLNiUkzOh6DWlOoQSlW3hTEpz3hTvEI2d5nIHmDpiXsw0bSfCtu
	JPXDcKZ5vmtPp0LvwBi0tyBrrI3NvQJne9MmA+VkfSHuq0gVMnzutNmqsx61c/B7k9O/i72Gonm
	ZaaZ3dHScBr08JL58yhYcnk7NkuuDPmQYsbIXj2ZQxD3aXQEVDVPyZsxkfUauxH9m10Aj/2kkFQ
	JL5J7U=
X-Received: by 2002:a05:7022:608b:b0:133:52ca:7dcb with SMTP id a92af1059eb24-134c8b337e3mr793467c88.10.1778711453723;
        Wed, 13 May 2026 15:30:53 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5152:641f:f5ef:6c7b? ([2620:10d:c090:500::2:8a9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a618sm1177799c88.12.2026.05.13.15.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:30:53 -0700 (PDT)
Message-ID: <38185cd5ac2c6103ec5af41347c5a76239bc670e.camel@gmail.com>
Subject: Re: [PATCH RESEND bpf-next v10 1/8] bpf: refactor __bpf_list_del to
 take list node pointer
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kaitao cheng <kaitao.cheng@linux.dev>, ast@kernel.org, corbet@lwn.net, 
	martin.lau@linux.dev, daniel@iogearbox.net, andrii@kernel.org,
 song@kernel.org, 	yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, 	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 shuah@kernel.org, 	chengkaitao@kylinos.cn, skhan@linuxfoundation.org,
 memxor@gmail.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, vmalik@redhat.com,
 linux-kselftest@vger.kernel.org
Date: Wed, 13 May 2026 15:30:50 -0700
In-Reply-To: <20260512055919.95716-2-kaitao.cheng@linux.dev>
References: <20260512055919.95716-1-kaitao.cheng@linux.dev>
	 <20260512055919.95716-2-kaitao.cheng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-05-12 at 13:59 +0800, Kaitao cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> Refactor __bpf_list_del to accept (head, struct list_head *n) instead of
> (head, bool tail). The caller now passes the specific node to remove:
> bpf_list_pop_front passes h->next, bpf_list_pop_back passes h->prev.
>=20
> Prepares for introducing bpf_list_del(head, node) kfunc to remove an
> arbitrary node when the user holds ownership.
>=20
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]
