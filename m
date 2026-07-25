Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F107D18A93F
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 21:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785014170; cv=none; b=XMHqpWo+AAYJu0CMdHeZ1q3Lg9BCuUw2lCVeuVcv2VYnJRpAtUMvSqNLjnO7B+VR0tVxTNsZ9LHyQxDK6+XTGZ1DPC9IM6MjtZMu8LxPQ65q/6iaWc/JyYjbw4oMVhjTagaYf1oe08U6oYJ/k/sjXhk5UnLhUVw/5dZ5IArkHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785014170; c=relaxed/simple;
	bh=ldOpqswUqkrtU/xufEDtFsL7aeqjiVAXwRFmYW6WrWk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gj78HvBHd4QExDjS0ilHlhare7C+49y9rFRkvB9JZxej6Y81/DP7uZO8dDPNc7EohzG7/rSXtADZomgpORSER+ceh+7u9Xc8aNqKs5VjelBCZSbuOEyV60ouTQkRMxjtt64xl+4wnFBFG15wNbSXqfUPPYjYxJsgurhjx68j3Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EIP2/TNs; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EIP2/TNs"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2F193408B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785014162; bh=Rfj62+l5YA14S22bMzo2AFL768rH8L9toeCxRKlG+bQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EIP2/TNsZsBdf9qVmE0aqTVnTErf9ROKRwGWsJwebsuXxqXnAklQdkivyowilSAtU
	 F5JNloEexQi1JlS0mJwf4+nFFDii3Au2WeGlfJ+kvAceRXJxQ0QyFXd/3DQr7MHlXx
	 G/qlCODZNKoEfftIoQjggq4Kl4NW1mUeSP9KKK8TozO1C67038lCEKiLtZDFHgfnAU
	 8AJh5tUPX+eGIO00VTIt95ZQrLk/3eo+Lhwq/GzjXiIw7SCQUZ3zipoebiA2yPmEzc
	 BKlILzo6g3UO7xrHab7E0vVaUz+ThujmRZ2HIBgSIy7Jnus065ZVYubjXxjGb7tBl5
	 F1erHLO2as4OA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2F193408B6;
	Sat, 25 Jul 2026 21:16:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: amandacorreasilvax@gmail.com
Cc: linux-doc@vger.kernel.org, danielmaraboo@gmail.com
Subject: Re: [PATCH v2] docs: pt_BR: translate the management-style.rst to
 Brazilian Portuguese
In-Reply-To: <20260725163554.018126@correacoding.localdomain>
References: <20260704202831.112653-1-amandacorreasilvax@gmail.com>
 <20260725163554.018126@correacoding.localdomain>
Date: Sat, 25 Jul 2026 15:16:01 -0600
Message-ID: <87mrve6a9a.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

amandacorreasilvax@gmail.com writes:

> Hi Jon,
>
> Just a gentle ping on this patch. It has already received an Acked-by
> from Daniel Pereira.

It *really* helps if you send patches to the maintainer.  This one, it
seems, was not sent to me.  I didn't see it, and so have not applied it.
I'll be able to dig it out of the archive when I next deal with docs
patches.

Thanks,

jon
