Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B846D093;
	Mon, 24 Aug 2026 17:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787591634; cv=none; b=UKnw70F38RYhC4PbiK/L4J0wzASAA9upqb+juyKKxVjOHiYTqvEwyuNyvXj3jKZwW97+6UhtdlbHgd4S9jLhqEp1KUuLZCD1OSgeZPpK4eWyAVRKJcrWnf20mJirLzuOBiPfX8a3emuTETL0OtASDdtY5488mVfydPjtjt1SPac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787591634; c=relaxed/simple;
	bh=vB8+GNf0yLigHN6Z8egd8OTUgn5NZZQwkIHdHEq27qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aSH/E1/oUgEOpgIhDP5M1/mUfdt9baDWzJ/vPzVw1rWoQ6rBv+km4RKDUzX8T0g4sQj3PNhD+rnmpppUT0gkg0FMVwe1XKGOLqIIBLStiMrZMQleQqRWX+81OU0yY9XeEdJosIxIIIg5MEx6cdDTJOrIkoNpzji1cZT6RScMQdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iN1GZBOC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iN1GZBOC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=EEkCFKJwZ2HCplCDA0L/TCn3nLH4UR5lXxa1vSpYTGM=; b=iN1GZBOCY7A4cBhv1eqTZOsgPa
	TMsGrqzxBMW9TrPEbqXqH2GriRSkIqEDMuqBll8/T6bC/c8ZGW6nlIf8P2x2jX6e+LtH2qA3KCV6H
	hiSyqQ8MTAUO+uvs0Ha6O97sOpmNAYq5ZE9mTQN2ecnYiR4DwYtMwVBJIaLwkevjh5l4ELNav8gYN
	Eq6FES2/TjMsQEQLAahRKU/PmZ1Uk/mXCocpI4z+RrqK2BQPKdNa8Kj/Qry7SaHDO+/MZZt34YAy0
	YYqmYv+xjxyVuutLu43qAaLtYz4kaZo6iv1wVWcFto7ODXDCqkSZdIY+7p+iyzhzp96xEZ+lEJASg
	bIMOwwHw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYF4-0000000H8Rm-3wb6;
	Mon, 24 Aug 2026 17:13:50 +0000
Message-ID: <9e3bc371-2f50-4ad7-831a-0f1b7350c9b3@infradead.org>
Date: Mon, 24 Aug 2026 10:13:50 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: automarkup.py: add skipidentifiers
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824070312.332802-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260824070312.332802-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/24/26 12:03 AM, Manuel Ebner wrote:
> Add skipidentifiers to reduce wrongfully high-lighted (bold) words.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

whac-a-mole alert:
"struct request" here is no longer highlighted:
Documentation/block/blk-mq.rst:will then build a new structure from it, the struct request that will


For most of the other words here, I'm OK with this patch.

> ---
> Pre-patch discussion:
>  https://lore.kernel.org/all/bba57d51c72d9387ccef2b5979fa618e980c3ebf.camel@mailbox.org/
> ---
>  Documentation/sphinx/automarkup.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
> index c2227ab0a..8a6174950 100644
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -51,7 +51,10 @@ Skipnames = [ 'for', 'if', 'register', 'sizeof', 'struct', 'unsigned' ]
>  # when following struct/union/enum/typedef keywords.
>  # Example: "a simple struct that" in workqueue.rst should not be marked as code.
>  #
> -Skipidentifiers = [ 'that', 'which', 'where', 'whose' ]
> +Skipidentifiers = [ 'and', 'are', 'as', 'containing', 'in', 'including',
> +                    'is', 'name', 'needs', 'of', 'or',  'pages',
> +                    'passed', 'randomization', 'request', 'that',
> +                    'to', 'where', 'which', 'whose', 'will' ]
>  
>  #
>  # Many places in the docs refer to common system calls.  It is

-- 
~Randy
