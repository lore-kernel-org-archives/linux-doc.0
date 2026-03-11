Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC6763B9;
	Wed, 11 Mar 2026 00:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773187379; cv=none; b=gx9EjnzpMMoY/A7Gy0UTSBFUgSDuUn4I9qkvgkmdAtybi64vKwAdA7UCbQaqOzQpy4ER6JoBHd9n1p8pQYj8SZI1uXYW13duv1oezzFLeeEGr132eg3ixBWOgN4i6s7yVHId12daIyBLiFdBve92sj2LDXx5uoUlPAYVcpp9rNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773187379; c=relaxed/simple;
	bh=gAo8pIpamNKNwt/umJfrAxt22Tj7aXcndH4imspEA14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHA7R/YQTbiGByWq6nPKwst9FnRyMvGy8AP28610JtG0sgDZyqLEVLbh1Tfr2oQL62d7Rj5/SGT1eXKA8OePwYULtSQWmIhfRRhCjrdZeTh9n95rY7qtJunmolXV/jNnHJqRgzIezhOEyIkqpjn4+NiUMQBWMxuphugsb2JkO44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0aDpCOm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0aDpCOm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF54C19423;
	Wed, 11 Mar 2026 00:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773187379;
	bh=gAo8pIpamNKNwt/umJfrAxt22Tj7aXcndH4imspEA14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X0aDpCOm8sxO8E04vKcPXSSuW9A/LnB6sSr8h33EbNA1n2ceJET0kYl+RnAVm/OKt
	 M/ivmJ52Jj50SKUfeORGMT2cmDLTr9gLITDK/H8h4RZuqFFostn/7us5r/cUhi2mi1
	 ganYQToKkx50yRtVRfFxM4dtMzMQXkkLYMQR/3TmzLYMWPnT8gkuqhEFsIfRbGg9bY
	 BapKRT/mT3Sb9eTC+1iFsGRf4Q85l1wo91fQACABBMqXq/uVZlmUqnJ6NyW9a3F6BN
	 pSE7FqG1ztRQg3FOchbpKugNWh8T8UZMfSDYybyv4Zua6XhqT0C7xB7UzCY1sLegko
	 NExKtC3XqcEBw==
From: SeongJae Park <sj@kernel.org>
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: Re: [PATCH] docs: mm: fix typo in numa_memory_policy.rst
Date: Tue, 10 Mar 2026 17:02:50 -0700
Message-ID: <20260311000251.89967-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310151837.5888-1-akinobu.mita@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 11 Mar 2026 00:18:37 +0900 Akinobu Mita <akinobu.mita@gmail.com> wrote:

> Fix a typo: MPOL_INTERLEAVED -> MPOL_INTERLEAVE.

Nice catch.

> 
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
