Received: from mta0.migadu.com (out-225.mta0.migadu.com [91.218.175.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6CB38F930
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787987724; cv=none; b=opbIzRLPm/685jBGnjXjtXfBCW6GXfyqfw79fM0jpnTP2KvpPRwdTaRAklcBwFcS+RLoiSzTEcduorfwpeV/9o4ENV6ADz6A345nm2ll+acgjnsaeyl3TUDNsnJQQ4TdrZNvwLY7YTB9bK/D9WEh5JKP+oMeQbOE/BrgRNeZa4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787987724; c=relaxed/simple;
	bh=SWGcWsZvj8fiVLTc4wzzXvO66kZLaBJbnY4FcfB6iKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnC/cnodNpFKqQpLdIz0zLwnwGnJ1NAPGBBig7uQDhWjPbc448wWB+dtFjPgF15n9jr9UjM1MGQLE2Yb+05xDy2rsWP+nCX9M6OL2lZ0m9znScc3HYd1R2qG7UWiRQ0DBCSKVa8TTFsBDRt9pOcDDHT08TmTFXvKESZ+ZH0iUVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Pn5xW3pZ; arc=none smtp.client-ip=91.218.175.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Pn5xW3pZ"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SWGcWsZvj8fiVLTc4wzzXvO66kZLaBJbnY4FcfB6iKo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787987718; v=1; x=1788592518;
 b=Pn5xW3pZVzeo4ZjngNjB/qv/DJNpDd98nEVW3nCL6coaRlaTwhM3eDmc9gaGGxTXGZxNPlmO
 Ch8jzuS2soW4HN1NKeZLwATlesV2nd4sb/PHYcv+qBs4XHk1DFFMbjY2KedS5eaxEE9Y7N2/ihG
 SAjwtdFA/FwNCvdcr2o06TRxZDjcKbc0XsK3Y9WbeIezbE/q6i5Pd91Yrx+cY5GFCSa5Xfj4e3i
 rKTQ8mgx5B6gBLhJx0NtQZZwzlKcs5z8y9VUdd0TFLgc9KYLmIhT8CuHzBOpnzeFu0i5Iaxgs4M
 QTLo6N3O9ofgPa62o6L0CZDvZL5GkY0vwAVMS5/kIfcaw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4fc2f53bcf373baa;
	Sat, 29 Aug 2026 07:15:10 +0000
X-Mizu-Trace-ID: 4fc2f53bcf373baa
X-Migadu-Flow: FLOW_OUT
Date: Sat, 29 Aug 2026 15:15:06 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Update arch/riscv/patch-acceptance.rst
 translation
Message-ID: <apKG-g3vNMtgvV6y@wyuan.org>
References: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>

On Sat, Aug 29, 2026 at 10:23:27AM +0800, Yukai Wu wrote:
> Update Documentation/arch/riscv/patch-acceptance.rst translation.
> 
> Update the translation through commit ed843ae947f8
> ("docs: move riscv under arch")

Acked-by: Weijie Yuan <wy@wyuan.org>

Thanks.
