Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844FD32F763
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 20:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769717580; cv=none; b=qSZHFnfhY4V79dnaYjtWxGkDjxrOUnOZT/scDD4Y4hDnrYabS/MATouQtiKZ0LQvSNHi7QURgt3LeGJ2yurzERQBE1tiuXnKzaK/lrpMNQjF9q4mokXVw4qfsZNGszNInuwWgHD/0IaZXQmwdEAc5kDj48n3yXoeSp4/BQ+tENs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769717580; c=relaxed/simple;
	bh=iWJxqh9v+b7ONeSHcsSKUAXb/55OwGTO4VzDIK6UzCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUJz8CChcWVNPNh7r1QIYyuwy6hprXtOn399dbTNQ3bgb8NGtmct53zEnqYGqR70XpFMzHS6DZZvpPDIghiojklX5ykaYx99SIjGuqzyR3H00uyWIeirXhS4hXaexKH76rD/I/R4ojMwzVqe4vTDMu3/3S2RVGBIcNOuejYCKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=JHpizm0C; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="JHpizm0C"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-81dbc0a99d2so706804b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 12:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1769717578; x=1770322378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpFVsPfnfQQNTQ0jdwFqwKURwQ4mgZxUyhFY2LzG0D4=;
        b=JHpizm0CmdpGiLFtoxT1597fZ4Erw2oViB20mK+MtVpedHnMobrxslA26x3OOuReOi
         QELrIDksppgge9w9Kr+l0+pd2k5tLvilNe4Dbd29u2WxGl/Rj6LOuu+Tz82/DpBD2RQw
         g9qz97uj2y7VZkFU6D7ZODz6FTa/WNSZ840UcdbPyC83ZOikgxKkKvhsoEjWrTQD2+4H
         dNk3yTLF63OLTbKU+/ssYxzqleaJVlhBzhfTyP3ulQWiqhTE8r/+i3oJ0fP8puFkKUJ3
         ilEz1zHYu6RL5tg8qwWdzlCwcgnlvF5io5A+SwVBSzok7xyuuMNJhQ8S9X6wZHsB7SQx
         EpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769717578; x=1770322378;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KpFVsPfnfQQNTQ0jdwFqwKURwQ4mgZxUyhFY2LzG0D4=;
        b=RbeRk1evw3IkXwY0WH2/njcogWUYFYoo+7g4BvoPdGZABNSvXkjoV/RYDCCvkHWfsx
         DFnBAtrklVS+551EQrw6kRPjLR4+YD/JrrTdnXkws5jLbdtm3UeORJ94hU+sA6pMlCLE
         dH1Ckyv773nA1jMs7TUAhWXMRgdVw8A+JVeeNw4Ko+ZjZv5zN3WC0KG+9ROb4NZPXEQV
         egUWND4CzEnpdnX4gtOtC2YxCiKllGzf4+AS6d7jxjQP/igQxcFF/xKNEb+XrrGuXl0N
         TxFmJAYqJLv9YtPqaVSvvb7G+2w1UTUsmwOwu8TDrGUx4/zETq3vjzc1oYr0gfd18sUB
         fZuw==
X-Forwarded-Encrypted: i=1; AJvYcCVYdLuOPLfGx8h4xOZ+VkJfJhXhfQpaSrhN2CMUKghpON+sWvPtoKW8qSvkC7lywhHHkMSQJI/eTF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+o+9RwEaS3QxhI9674oqwGgyZM00YDYE5lF49rlzh336beKTv
	HBEnIZD1jX2Z0argACX9Z88uyb1gxmCLq6hSe1+BMAmStow5zySbrvUiDYOgwkYIGBk=
X-Gm-Gg: AZuq6aJuu0KqPUo8L1b4q9VvPztrZCec6qp6WUFMOp2+3Y1P7OMGG/7CUf69noxGne8
	yFi2BTA6UttYwqu/qp88ZboaiOto+x7YTgF56xpMEIat+Gr0w3VzTyP//uUTw6vqbvz8zmeU0rx
	GiccZp9jLGY948qWkYScAU7UDPTO4lb3uQKgZ+YB2K9XkXzn9jCM2dXG7HIPFVQlQdFDuiS8XQR
	TB4OnLIkEEedquzKhM9d7P3N+MCElP8IEi9NmR/U7B+VJDLBdxBSD2Sslc2QeWyE35eU6oxFZSo
	nAloNXEA1veo1mghmudAcbCyrxky3Z0WE6J+QyYJksFiOuUD2I3+kk/lKBkRrlMdCianK2Vl5lt
	LwGeyxJKDHrH7301vPN4PkHlw047BOAd0dCd0ZlUAOIAQqYbzkwNcSrymUU1MU2gZ/mE=
X-Received: by 2002:a05:6a21:a42:b0:366:14af:9bbd with SMTP id adf61e73a8af0-392e01a8f7cmr203112637.71.1769717577697;
        Thu, 29 Jan 2026 12:12:57 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642aaecd19sm5852908a12.29.2026.01.29.12.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 12:12:57 -0800 (PST)
Date: Thu, 29 Jan 2026 12:12:56 -0800
From: Joe Damato <joe@dama.to>
To: Fan Gong <gongfan1@huawei.com>
Cc: Zhu Yikai <zhuyikai1@h-partners.com>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, luosifu <luosifu@huawei.com>,
	Xin Guo <guoxin09@huawei.com>, Zhou Shuai <zhoushuai28@huawei.com>,
	Wu Like <wulike1@huawei.com>, Shi Jing <shijing34@huawei.com>,
	Luo Yang <luoyang82@h-partners.com>
Subject: Re: [PATCH net-next v03 1/4] hinic3: Fix code Style(remove empty
 lines between error handling)
Message-ID: <aXu/SDa0Z+w0v5zv@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Fan Gong <gongfan1@huawei.com>,
	Zhu Yikai <zhuyikai1@h-partners.com>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, luosifu <luosifu@huawei.com>,
	Xin Guo <guoxin09@huawei.com>, Zhou Shuai <zhoushuai28@huawei.com>,
	Wu Like <wulike1@huawei.com>, Shi Jing <shijing34@huawei.com>,
	Luo Yang <luoyang82@h-partners.com>
References: <cover.1769656467.git.zhuyikai1@h-partners.com>
 <ccff2ae7abe91bb3618ded9bb5ef2dc9cb243d22.1769656467.git.zhuyikai1@h-partners.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccff2ae7abe91bb3618ded9bb5ef2dc9cb243d22.1769656467.git.zhuyikai1@h-partners.com>

On Thu, Jan 29, 2026 at 12:01:08PM +0800, Fan Gong wrote:
> According to previous review comment, fix code style of removing empty

Hm, I'm wondering if maybe the subject or commit message could be reworded a
little bit?

Maybe something simpler like:

  Subject: [PATCH net-next v3 1/4] hinic3: Remove empty lines
  
  Make error handling paths more idiomatic by removing empty lines.
  
  Link: https://lore.kernel.org/netdev/20250902180937.4c8d9eb3@kernel.org/
  Co-developed-by: ...
  Signed-off-by: ...

Maybe Simon has a better suggestion.
