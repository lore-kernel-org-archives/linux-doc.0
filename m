Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2311820B7EA
	for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 08:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733990923; cv=none; b=rYwM4waQp+hDEVjdW7Ag4Uo4lSFBqK3gXpOIrFsBAEg4SVfNDGjCoPp3alNPBA6B59uWMgdaP0DUzb9UgGWH7oUDo7lDTj5uli+U207hce5Cj0+JwwLseSLrnWvoVaioCs/hrTTKMhoGfcYphbinHLvoECeVnW+hK5PTWQrNgE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733990923; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQxGVKccF8OdhDwFcLf+7sWClhOseBY2eIHA5wUsM9FZKHzU0SckOwajutK/DJBVORZaDZ/GsUOHhG+EIKg7ttDcRwy4F/z1ylzjikCscjk99CT2f4zUslZ9VcbOzs555iBhg/pCKj5yoooniF7jqv6rdh5Sny8egOLEeESIDFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8CF2F68D0E; Thu, 12 Dec 2024 09:08:35 +0100 (CET)
Date: Thu, 12 Dec 2024 09:08:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH separate v3] docs, nvme: introduce nvme-multipath
 document
Message-ID: <20241212080835.GA7862@lst.de>
References: <20241209071127.22922-1-kanie@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209071127.22922-1-kanie@linux.alibaba.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
