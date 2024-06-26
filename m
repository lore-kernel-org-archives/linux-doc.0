Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C66A92F
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 15:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.103.80.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719415921; cv=none; b=q67OwYT26Ttp81saFJ7tHbO0Pxmp7HeCL21e+ClrsgzgCwC+2Ok0lr88TaLNBq6Xl8idNvHTQDuelfrTlsgeklsnzzKlF82Hgkal9Hzac1fXjEPuyDL9CnsTgjbqvGSOUAgLdiusDjmQfVOD3SdK8xXHS57vMsVKr8LRZZbuzj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719415921; c=relaxed/simple;
	bh=l2b8ZyapOcH2oqMP3Me88Rj4ZBEEEBUBCqUc2+772iI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=cWtr97SXSu1zQ9PKvS6lDENnl2nZcatxQ+21ELSmI+yisiKTkQAXd4z1vqIWsdi8RYc0x6CxEiixklinEw3rP7mxwKXMyVKA9tKmUqAMO4NNsvoptNrYRrjmqIoJJlSd0hvKuXqhVfrmJodpXcFezm1f09UZTo7lMgGNaMRvg5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vaga.pv.it; spf=pass smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b=Rv5HZc0r; arc=none smtp.client-ip=212.103.80.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b="Rv5HZc0r"
Received: from localhost (unknown [127.0.0.1])
	by mx.kolabnow.com (Postfix) with ESMTP id 30F4D20D136E;
	Wed, 26 Jun 2024 17:31:49 +0200 (CEST)
Authentication-Results: ext-mx-out011.mykolab.com (amavis);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
	content-transfer-encoding:content-type:content-type:message-id
	:references:in-reply-to:subject:subject:from:from:date:date
	:mime-version:received:received:received; s=dkim20240523; t=
	1719415904; x=1721230305; bh=G5X5CaV+LzeUtcFjtuAhzHUHRZc+gQiWQCV
	u+A0+3pE=; b=Rv5HZc0ryApMNmAcnbu56vBchoOk0rXdtQuFFCBSbGO9+lsRS9V
	UFZOnxdt9nnh/68zcEPMED7fYBeFCibnZXLgdLRvWTllvqUr07hHpNXu11pj65Jk
	mGPpG5Q8gcictDE6p8mDQDuaCuT0+K/T5Wew8YGYqrnd0xImjPw+WvJKqSJBJEI+
	DycGljTw7OxU6kcSHgkUjtD1DHd4xbftWqofwoqRbiY5S1DqarzgqzkXh2ZMyQFQ
	2OeeZCuVpCUFPXJxPl+st+n8JW9d1q7W8uxNdK66/EUEZnPl0myhquC0DA2eC2Lw
	IBt0AQj8MT2SqIvhXSgJ4OS/Pa4Mp97330Q==
X-Virus-Scanned: amavis at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -0.999
X-Spam-Level:
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id p9CGeMoq7R0m; Wed, 26 Jun 2024 17:31:44 +0200 (CEST)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
	by mx.kolabnow.com (Postfix) with ESMTPS id 0267620D1358;
	Wed, 26 Jun 2024 17:31:43 +0200 (CEST)
Received: from int-subm015.mykolab.com (unknown [10.9.37.15])
	by int-mx009.mykolab.com (Postfix) with ESMTPS id 709EA21F4E6E;
	Wed, 26 Jun 2024 17:31:43 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 26 Jun 2024 17:31:43 +0200
From: Federico Vaga <federico.vaga@vaga.pv.it>
To: Thorsten Scherer <t.scherer@eckelmann.de>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc:it_IT: Fix typo in Reviewed-by tag
In-Reply-To: <20240625210455.13262-1-t.scherer@eckelmann.de>
References: <20240625210455.13262-1-t.scherer@eckelmann.de>
Message-ID: <e9f4b439b995036133cbee2b53684bec@vaga.pv.it>
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

You are right, thank you for the patch

On 2024-06-25 23:04, Thorsten Scherer wrote:
> Signed-off-by: Thorsten Scherer <t.scherer@eckelmann.de>
> ---
>  Documentation/translations/it_IT/process/7.AdvancedTopics.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
> b/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
> index a83fcfe18024..b3d8b62f3b57 100644
> --- a/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
> +++ b/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
> @@ -200,7 +200,7 @@ all'ABI dello spazio utente, eccetera.  Qualunque
> tipo di revisione è ben
>  accetta e di valore, se porta ad avere un codice migliore nel kernel.
> 
>  Non esistono requisiti particolarmente stringenti per l'uso di 
> etichette come
> -``Reviewd-by``. Tuttavia, perché la revisione sia efficace ci si 
> aspetta un
> +``Reviewed-by``. Tuttavia, perché la revisione sia efficace ci si 
> aspetta un
>  qualche tipo di messaggio che dica "ho verificato A, B e C nel codice 
> che è
>  appena stato inviato e mi sembra tutto in ordine". Inoltre, questo 
> permette ai
>  manutentori di prendere conoscenza circa una revisione avvenuta per 
> davvero.

-- 
Federico Vaga
http://www.federicovaga.it/
