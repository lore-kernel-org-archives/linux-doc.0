Received: from mail-yb1-f226.google.com (mail-yb1-f226.google.com [209.85.219.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE2C253355
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741378282; cv=none; b=mFK1ehmdiSgs4/DHA+kALSJS/plSDGJkykH2KqjxWSN9ZIzR6oxJYLyjStp/AShpyBmzpdzH4vzyrPAmz5HIR6J3T1yiksIRShrGslClBrA2N2sFgoPlanSgQUSxf5mhLbr7Qdo8Bl3eN4pleBD+BMHvaI4Li852XYu9hlmXzRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741378282; c=relaxed/simple;
	bh=XnokswpRVUawxvrh0+H2EO37FE3w3hGAjLgWW05bx5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVboDl7z2PiJeTUslNelTvEFnYuiNCPCn/qs80cMk+otrxcCjscaxHit9Am/zOxQb+Gnp/mvqLOTvxeX8nJyxLMBWTTiZSJ2qhAzkgJA2q5O8SRrhRNqp2vb0IwCLfFsd2INL5ZcQh4HcZGvHeLY94lUuPgr84KMV5w3xH+Uo1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=CfSYRyIR; arc=none smtp.client-ip=209.85.219.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="CfSYRyIR"
Received: by mail-yb1-f226.google.com with SMTP id 3f1490d57ef6-e611ebd9a61so1972488276.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 12:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1741378279; x=1741983079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnokswpRVUawxvrh0+H2EO37FE3w3hGAjLgWW05bx5c=;
        b=CfSYRyIRM0jvy6C5rlcEtYOXSsnlv7OSvkQwANLjzG2JXhoMm29V4p54eVVBQaje+J
         fWjH37Oz3gCjbNIjGSRJDd58FFpgoTDu4qHV0L/RSIeIm5t50TJc7cj8na9T0Js1Wx/J
         WtGmHs0cgm5U8BMk1qViLwLSPXK3GwdvDgVDX3krXqKGT6Y0eP+Er1BZoBVCG6zajfT0
         IfFmQE8wEa5aBolFsh6lsZbzpq8YMdrRelsbbiCep5cpxj1AIOdCVkld3PupzTZ4EYnO
         in26eGJxEloLkalZNdVzOEeZtjcFo4jpIQbpDpfO3IE1KSw0IGC/rym+0ZZLVNwj9SPP
         /QPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741378279; x=1741983079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnokswpRVUawxvrh0+H2EO37FE3w3hGAjLgWW05bx5c=;
        b=UJJQo+s2xVfHguyIOTPTcRKtWCv1oe8/QQ7PwzpRc1aDAYd+pfCFdI2iqFBZjuUMM3
         rwwGLPNIbIHPkFA67Q5yhNyz4HH148I5u9ndE4m/UVnOOkWchA/sDEZ+dU0gz6XGSvxv
         kGRqj86otIiUpOYDva6tW2MNM8xiKY6bQI1l+02tPleXiFqIIfyrgxvrwYvo7Y3/eHTB
         mXYwN/8DsPZR0ElTr0LTQiyrHZ+DtwLvLZAoJP6MJ0xWejetnVK3jv6B2PLG3vcrl2IO
         myNIfXclrdb7obNe7yV10edyeYI0KTSsjqVw6IvTQ238WzXA0+VISrv7ZPDF9y3eRH/0
         KczQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD8IqMq4hk+UxOXxBxUfu4Rezjx+64vZT+bS6LU0hgOID3AJxDB6Jctnz+c3r/HuK1vpE+NCSdEBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7oho8aCE9iMq6ejYmTr7zL110B/HvVJED1Kamt/XG3uUjkwJo
	IsVtkcMTBaFv2TEZIoL+J43Dejt0GDwRWSm6Rc1fnrtG/q6mMhh8G+hIeHqEMbxpyWHtj3LZO47
	eakeOOWGzpseixXQ0a0m+/3YrTr8qWta0
X-Gm-Gg: ASbGnctR8gIZ3ZlUO0Tj3IAvVP2TZPTNSv0/QDmbOr1TK6Ad7ALX+g1ezF6OSIlGCaO
	mHGphliqxwWTkmXwrYquEHfzjRsnlUq1vStmSbHGUvsYzC10L0R9Nqiy8xoHLbraIfuGt3Ktj/H
	26ovm+8USijtele+wg7PIg35wu5Hpb04D2T6Oj9m50tt+dFYn2t+wXP1VhkQcNtwookI2mAKDBo
	KDJso0qcOqu44wIgGUpftkmAzkwqISm1C1cWhlZiPQdsR26fBGdnjXwT0PZ9aSFHoUca/NBx3Lz
	aPt3teMKGZJgYVrHMrRL0JSWg+TPGcTCrS2S07VZ/i8kNhDqDg==
X-Google-Smtp-Source: AGHT+IFVIC1dPB2oQzuEy2i1L1p+CBm3CNBs2IFDf0LbWaFMmjn30sMZygpeRyebFOscyIQ6uTQhXSytdw3F
X-Received: by 2002:a05:6902:18c5:b0:e63:3e25:d71a with SMTP id 3f1490d57ef6-e636f7e8b1cmr1236822276.15.1741378279189;
        Fri, 07 Mar 2025 12:11:19 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 3f1490d57ef6-e636dfd2009sm42439276.12.2025.03.07.12.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 12:11:19 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 4B339340245;
	Fri,  7 Mar 2025 13:11:18 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 3F0D3E56FE8; Fri,  7 Mar 2025 13:11:18 -0700 (MST)
Date: Fri, 7 Mar 2025 13:11:18 -0700
From: Uday Shankar <ushankar@purestorage.com>
To: Simon Horman <horms@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/2] netconsole: allow selection of egress
 interface via MAC address
Message-ID: <Z8tS5t+warQdwFTs@dev-ushankar.dev.purestorage.com>
References: <20250220-netconsole-v5-0-4aeafa71debf@purestorage.com>
 <20250220-netconsole-v5-2-4aeafa71debf@purestorage.com>
 <20250225144035.GY1615191@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225144035.GY1615191@kernel.org>

On Tue, Feb 25, 2025 at 02:40:35PM +0000, Simon Horman wrote:
> Reviewed-by: Simon Horman <horms@kernel.org>

Hey, since this has gotten quiet for a while, just wanted to confirm
that there's no action needed from my end? Is this in the queue for
net-next?

