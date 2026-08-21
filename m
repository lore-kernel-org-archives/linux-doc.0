Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8298F376A0A
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296430; cv=pass; b=THMcj2SmrYFo5xe5chaft21m8dQPcsXblnLOqvcnAmqNjCU51WX2/QIbL9woAdzrsKN8XeRB8H+R2TTcR0ue5h7RWs30PsGOTutrDO1927KS5kwehdI/vIaPLtaDRSVBenmnu7+iIubTXU6tpOUO6g6gY4wL3mxHZbdjQo61wkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296430; c=relaxed/simple;
	bh=uqAbS4dTfTTGHXSkUJo+Sd5SgmF53nYO1Vnl0ZAmKSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hISJQnTyVL1/hrXl/xIKOOGxQOPXnSQ4IJoBaheqy5/aUeoZeHnWzCKP6WzAKw7cV82SZYczVwQUSzRk28Hf3TVD7XWTUfMZGHcVQ9Rip2O26q2mLl04TAY5idK5L4C9tmXU5EoFtJ/JwHOkwgqZb7kfGx/V830wlttWqptAAdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGCzI+5l; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGCzI+5l"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a180d7c70bso481411fa.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 00:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787296427; cv=none;
        d=google.com; s=arc-20260327;
        b=OoS3pP5pUD0rHbWG+O6O05dOZLN2LXfcrvBKGn3T72+YCohrOmGbokm4fcpvlqb8/l
         xrU1lbBAzEW1KWlmDqzTX4mbupbe0WEWuSnYPi7AuJAAXu/j2EQ2zkzqBLB8vTe8qdug
         Y/OOYG74nQ2NIftMXEE+S61ex+a9QwkKsHMxgOdu3K81sYb9SRN157YXSU0JvW/rD6i1
         3/PJwi50j4EqXyqDuLuuwcW9DgilTbgCYJQRQO1DKW0LEaMHtoaMubmMuApTOUjF1tYw
         han7FgbFtETvDBF/+GYGTTrNUIEWxF5GLUC/P0TccjdciEfEylD6m98Pmbie5UKldesM
         Bx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uqAbS4dTfTTGHXSkUJo+Sd5SgmF53nYO1Vnl0ZAmKSQ=;
        fh=Z8WBccBWl5Nm8XGnJn+Hz+ez30ztPA+XZEM1kKhf+y4=;
        b=HBFsFMOgHAWSXrXtHVArca9PRPUR3P30fiKIQCRRB3u93pA2Yx+cIm7P8MWvZWUyeB
         WAoGDQGVMzOE9BWVDXJjTKL7m1kJv7rF42KDSGtQUoJJxOYliUoF6MfN8rY4RHAv9AMs
         q8Zx9EZcUGdlqi+DBlcUTnAnJvKZmBotSzD0ETTSi6/F6x+ud8JttAoaf2urASGbQQKL
         qOEjv0z52W3EJ3YpUmLSbk+SCJP7bNmfGDEBImCtXL0dJhCkJi2xXN4TM3eV3jcEbnYE
         OgJnQZE7YfE7zhAWtRbax5km8PJKXBHSxF3ApmS+oiWhmE65YYqbfiBRCikDP6uHqUXD
         C7aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787296427; x=1787901227; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqAbS4dTfTTGHXSkUJo+Sd5SgmF53nYO1Vnl0ZAmKSQ=;
        b=oGCzI+5l0rlopHVq9X98ym3zJObwhBvwSHhLDKaxLct7ly0cs+b6h7lVdZUsYKlovS
         qmrO9qHfM3MfLUld+qKBylkNAph4R2q/CsTa1NEbdT9JYq5+FE0qL/9cDzPmP4VFMm0I
         HsOVU39GQsSLO9TiIYJq/hTjxdqsIuuye+AekVCPgUXHsEkOk7PIA233mNIGW9eNnmJH
         ri2oebQQAkmCmAyLl8xDJe8moeP+HxKy6WsjeV2C76R5axMMkAp6vtBrjsYkkdizgs9Z
         UFKAXvdmpm8F0Iq7+J4VkxZrw4SmyMBTedaFM3qfVC2XdgbWIpbcYX4mONUqFZpMVFwF
         GJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296427; x=1787901227;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uqAbS4dTfTTGHXSkUJo+Sd5SgmF53nYO1Vnl0ZAmKSQ=;
        b=pQ0ZmJ/3UWHJXAXrmlUPxNRcEhcZgKmnns/HTGqrlmbzly6mVToQK5if8noBWKrJcB
         vLlYMm2XpTnGNlN4Wk2rJTRLjrfQdqdNICTMml2DIqXuud0ZlJOAsIRzv7k29pqJGNlm
         FW9bCr0afcK9KnF+U0zCTYfcfkyXEY4FhG2xWrkOm1OPkHGMCfYtwQJ+RKjNpI5yd0q9
         DduDgtLsxDCGjES8JgbqnNS6tlti4zzczDJVj/mP0M5gU/PbDdwbOO+dICld27VXFWK1
         rt+mBneo/vo8dRKonp7PHzOQkE8OVfy0esHO/iJZWviK/azCxeGHCYJbEMQ2n88wMOw6
         zO/A==
X-Forwarded-Encrypted: i=1; AHgh+RoSEJAthWje0Q72ZoFLUlrpV1NuO4hVGthXLt8QgIaL7wCh1oaqd4eOBsYCLo7YH3txCWZ9TNgdvMI=@vger.kernel.org
X-Gm-Message-State: AFuF++mmUsYXW7+vo4weFe77AxZ6debZ2VerFilP9unvTyLENDRBAiWA
	z+OeOKJ4vup+U6s9S6cpiXbBEjDE3upTB6OBYdvcxlvwVliIsyRzOvCor4m+0UQ5RXvFXqrRdwM
	kRn+zz6Y2ua2CA8UcDgSL3M16o93ZCpw=
X-Gm-Gg: AR+sD10RK37LJMT1nYsPKEMZAwlFe9hyLAqSYUyLU69hNF3QrTIWSEmLqb6CKMc/ANB
	QA3aFMjnhYGrGEOTRWdPVo0ZlSGXRv/g6j9gFD5sZTg4/3xx6fgY1t7mJmc7ZhRpujcMkGkiOig
	NmCA7LKfFoP/efkjoNiYqMkLBFD6QrlhCOaxRzMkwpbUzYk19bIFTCAWu/D+OM7RZRRHyp8YqXX
	nfrSIlY+KpOHuOTAUUUexfZtEs2CRFLGxevr2fLE5V++BRURY02lwYieizwDvobQ4sOX1bhOZsC
	ccgupvfRP1yNkWod9pUnOJPzGv/OvcM2P5m1mU18icqV2Oi7JPQ+Bv4FBBCwGeM7kFzOVs8Fpb1
	7j+sUS8cIwOGolFVjmBYf8E4u/so=
X-Received: by 2002:a2e:a555:0:b0:3a1:6357:1a46 with SMTP id
 38308e7fff4ca-3a1ae841ebcmr4315791fa.0.1787296427301; Fri, 21 Aug 2026
 00:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819145808.291567-1-chenyou910331@gmail.com> <178720101976.15514.2188001271058942676.b4-review@b4>
In-Reply-To: <178720101976.15514.2188001271058942676.b4-review@b4>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 21 Aug 2026 15:13:35 +0800
X-Gm-Features: AcwNN1UD41YXfMOSce2DX4uU3H6qVKrVqx21WxAnuO1hPUBLIqpMzQPrKxDqB7g
Message-ID: <CAKspUhLo__Y4WV-VuJoWXKEoXwx1bv15kh2e_8pNKvPqOS8LNw@mail.gmail.com>
Subject: Re: [PATCH 0/7] docs/zh_TW: remove duplicated maintainer contact information
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 20, 2026 at 12:43:39PM +0800, Weijie Yuan wrote:
> By the way, this is something that occurred to me as well: for articles
> that were converted directly from Simplified Chinese, do we really have
> grounds to say that the original authors should be responsible for the
> Traditional Chinese versions? I tend to think not.

That is the part I felt least comfortable about while preparing this,
so it is good to hear you reached the same conclusion independently.
Someone who wrote a zh_CN translation years ago did not sign up to
answer questions about a character-converted zh_TW copy of it.

> Has anyone objected to multiple commits in this series sharing almost
> the same commit message? Just a thought.

Fair point. The shared paragraph is there so each patch stands alone in
the log, but seven near-identical messages does read oddly. If this
needs a respin for any other reason I will differentiate them; I would
rather not resend seven patches for wording alone.


Chen-Yu
