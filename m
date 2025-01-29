Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67D517E01B;
	Wed, 29 Jan 2025 01:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738114208; cv=none; b=QPZsMOKfhn/esIg4Av6xaDfz1p5u/0dNeesfU+tvsj3yUw7Cp/RY74aHhyds8Nun+Y6HqUq/F/TAW2+ASLPJYTMrOMNea3vHUqeaRSuglR9NAJB7lOaBCcdD6IhtQxUDQeM/Br+FvP1gwcl5SafpeCLgIOVSgzDrDV56qrOZWPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738114208; c=relaxed/simple;
	bh=jQjslV3b3JPVsVpOP9TZfHwaWjQY/5by3gTwJlxoZiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFYuDc3l03fAzP7s6lPnhXJZFEcLmQ7kb2d7HYXPdjsrOIBCkdaOjRD50BVKT94L/uQiFCM7Py176qlvXf5yyF3NxYj3fJ89UM3wVRhAucSdAVZ0s8DLHsobrQlKg7EkQa9Ip6nLVsWgBY0CViFwQ0+1fnOnh/YRusWX3wKiwz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jQmQ2SqV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jQmQ2SqV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cxtbKX1wNf6OyBBAuv4XVaj4IE6VdPm9vXvBAexoybA=; b=jQmQ2SqVaj+Dswwev0XtmkKuOQ
	PwYzcO/yxVvKO5pQTw0qNgEKB9hsAQw39xvBa4EtCq/aFC7j4dZcnYLzJq7kLeLMWb1h382Jk0yOZ
	XDBUPRpKNHLZZae+eKnn5NXIKuq/DHS5bl2py7i5XR4Ac4gzXfQGRtT4OFSBWKTpwWCYZ/647hI72
	zpvqs7SXA0HBfJI8QcOAP06ZSQRltkEGPVguRLEVKjHArm4WaNbrK2dHS0hh1wsaCONGksg2SUjwJ
	zYi1EYMdYT/rKAGXLDJd1TNz8EtMxKiP+9SGMcsrdF/cRn4mjBMQVRi62GRxX5BiepLO4pKREXLiI
	Osx9ILNw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tcwu3-0000000BNkr-204h;
	Wed, 29 Jan 2025 01:30:03 +0000
Date: Wed, 29 Jan 2025 01:30:03 +0000
From: Matthew Wilcox <willy@infradead.org>
To: carlos.bilbao@kernel.org
Cc: corbet@lwn.net, akpm@linux-foundation.org, bilbao@vt.edu,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] .mailmap: Remove redundant mappings of emails
Message-ID: <Z5mEmwDuATHAqJsq@casper.infradead.org>
References: <20250129011555.1108720-1-carlos.bilbao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129011555.1108720-1-carlos.bilbao@kernel.org>

On Tue, Jan 28, 2025 at 07:15:55PM -0600, carlos.bilbao@kernel.org wrote:
> viresh.kumar@linaro.org -> viresh.kumar@linaro.org

I think you took out the wrong line?

> @@ -721,7 +720,6 @@ Viresh Kumar <vireshk@kernel.org> <viresh.kumar2@arm.com>
>  Viresh Kumar <vireshk@kernel.org> <viresh.kumar@st.com>
>  Viresh Kumar <vireshk@kernel.org> <viresh.linux@gmail.com>
>  Viresh Kumar <viresh.kumar@linaro.org> <viresh.kumar@linaro.org>
> -Viresh Kumar <viresh.kumar@linaro.org> <viresh.kumar@linaro.com>

You surely meant to delete the line above and not this one?

