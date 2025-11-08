Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B605695
	for <linux-doc@vger.kernel.org>; Sat,  8 Nov 2025 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762642244; cv=none; b=XPsaN3E3cENli8Vb6XD7r+l9l+T0kAlfeQdUQto7sRWPTRZfCsVgYRQNxrrqS2KwAcJF0/GijwH2WnDe0sXhilsz96XB8CvyxZA5Xd9UY9yDiUVfefQ7t+pTGHwV91+K8g1Gp6bgv35CUFqxxBS2xi87+BVKk5ty1+Gi5l7vu0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762642244; c=relaxed/simple;
	bh=UpBoe1JLo0/DkptDkLTc6Y+pDFfBlXMluQ0+x62EKoE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=dV5Q6rohnFwBSsdqanHWpsVkVTAtOZ0h8qENC/0ohFyopo8/JYwKOezkGs60CaGUshlnu5I52fXcxLeMQ9sCfoD66XJxA+fI6CCV7QaC0nXBVjYmomhQOpv3lln+wni445uJMiL/tlMVjnRHeqrDy+7enJCT1xDSMqDpHWUyFuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IBOzjuua; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IBOzjuua"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1TjlcJUZB9y6Ufrkswrd6wdb2TJE4hxv8mQf4VniZ4U=; b=IBOzjuuawv8pGrAv33K7RuuyIj
	jrvtAMtLTtJum1DFlil1WjwU24f782em2xse9nZ7/etuIPSVifDy/vT4dVsm6AADZoxVFBpYdSoCV
	aHItcl9VfVv47wK48A1GUNbyICOohl97N4TEo+RPw/3tZzQttIvnuyTStxZxSzNXnbBc5u4LApXru
	8nR1wiasi7/w3cou5qnqIqKX4Qldw1WJHIqwntdM9jP2u3jj5hqHD3MGxfcRRZov5lJcZ58zCFwD0
	qUOpMofrb7bW92/CPTKub7EiYaFk+HToMJzXfQi7vWSP96P9Wx21fkSayAugLuy3zDbi0S+jTWpg4
	hvUBYjuw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHrlU-00000003Xfw-00w4;
	Sat, 08 Nov 2025 22:50:36 +0000
Message-ID: <80701524-09fd-4d68-8715-331f47c969f2@infradead.org>
Date: Sat, 8 Nov 2025 14:50:35 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: make mandocs: subdirectories scanned
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I just hit a problem that I haven't encountered in the past.

I always use O=subdir to build test kernels, where subdir is
at the top level of the kernel source tree.
(I just found this maybe because I haven't been doing a lot of
kernel builds lately.)

This causes 'make mandocs' to recurse continuously because
subdir/source is a symbolic link to ".." (top level of kernel
tree) and kernel-doc finds all of the (same) source files again
there.

I first discovered this with a subdir named ARM, for arch/arm/
builds. I tried renaming it .ARM but same result. Then I tried
a subdir name of "snap" because it is in the .gitignore file.

All of these have the same result. Here is an example of the
output:

Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'rstat' not described in 'gfar_priv_grp'
Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'num_tx_queues' not described in 'gfar_priv_grp'
Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'tx_bit_map' not described in 'gfar_priv_grp'
Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'num_rx_queues' not described in 'gfar_priv_grp'
Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/gianfar.h:1105 struct member 'rx_bit_map' not described in 'gfar_priv_grp'
Warning: ../snap/source/snap/source/snap/source/drivers/net/ethernet/freescale/fec_mpc52xx.c:698 function parameter 'may_sleep' not described in 'mpc52xx_fec_stop'

Would it be reasonable to have kernel-doc not follow symbolic links?

Any other suggestions (other than not using local [in the kernel source tree]
build subdirectories)?

thanks.
-- 
~Randy

