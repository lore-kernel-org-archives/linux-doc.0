Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90562747B
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 01:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757811759; cv=none; b=KY8WJTLJe252BHVSDWEfoUk/AJtZQ63Abmtf2HMJFc9glvmohfe3aGdeR/+Jf1bUbI6ryjf/WWx5ASDuoaBcBiBhvYsJsfEPKVF74K5Br+RWAr6RIa3aDMKjKqpUMqMSDe2X8HWrtwNBwiNXkYwcZs74R5uVFHOZ8MenQbrRTYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757811759; c=relaxed/simple;
	bh=YcKYuOsHQiDmDHla6Xc9HOipmRbCz7uiQeIiuNrHhNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j42++Tir2H+88f5XiGQWo7raHvtdA68GfCKcT72gEIez9i9WqEcww7Q/jRpJ+VNmWUN4iF8eDoOrdHxIOobOpOTt6Bru/GoP+fY7KNbaC4Ag5s1gHsVpKwFRCBn54tK1/FzB4i/yyiKW6R0N7nFL00DR8N5FOmUyoELhH9zOJCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyu5u5jY; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyu5u5jY"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4c9a6d3fc7so1852470a12.3
        for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 18:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757811757; x=1758416557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3tFCttzaSkqmy6bwSxlBN+tHDcFNxwADclbMsDDT+0=;
        b=iyu5u5jYxzEeJuSktwBJGH9fXc//pmvM052H+KsPQ3F51JhhYk5mu69WFxnoj16vsr
         I24Tb+QF19R4w81muZtAdQ8CIikps/a42aNpmw5ip0cIi7K2Iv1Ec7NuiAstHFDzDBk0
         z1EKa+bGv8rwpAav61zktX7J5EmnmrqWDEsGXD5CVJY/BO8ioCJgA+ij5SxNwkn4f4EZ
         QcUoysVyP6wsasG+1bWCp7i6mpc0quAmWoJHUuZHrm2YD9f1Byq35jOjlVtwQsLGDn7c
         99/4JeVwJXO/2HqcxGfFKKn9RatObRRZgSZicKRk/O8PSWX4/0tSztxP8+mWIeF70b18
         5VxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757811757; x=1758416557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3tFCttzaSkqmy6bwSxlBN+tHDcFNxwADclbMsDDT+0=;
        b=Fm37NcB1e/hsWNsN/uwzTS3EgHgeFU/BUqS+trikCxSr8PNo4fn3jrVhgplUQyLzvj
         CvQF3RjIn2VttT+M/rYJ5JTHv8NGN5+YgoR9dvzhHJfOrZP8P76FLE+QesYSAnvI6oJe
         YnAXQpAycCTGCAXa40tpzfDgnkfsvwaxrGn9dA9vLc7db9rwSq2h/W9BQeGkC88vEK4z
         +uTy4G5YA+ZKfeczk8Dg9G1POGt04hpO/28ZE+x8V32nWPoM0U8tZqQWWzTphdq8jHHR
         VDtYO/t61Y/9FeSO7FPVkFosZHQpJYalHadxJy/iZVhblSJ5plZy/otvbq81f3JfT+5S
         aBIA==
X-Forwarded-Encrypted: i=1; AJvYcCVBahxTrYncYDjX3fQ2fjXCyq1UAO6S5kwsvtn0A1La3NmVmdg6vhLIolFKw31cZGlqUy1D6Na5jKw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3jci6r+uFHFwNOLzDXyJzc5nc84npQQS0YhaTlRtulceCdIR8
	ieFQ1Mk7Rw9h9v+h3TPHNk+oEvwJzDB4FnkHpOX/AEQG4pUy+PqullYb
X-Gm-Gg: ASbGncscF00No1JFfyBVhjcIvgGN0R8qXhniBJoHCoRjWN5GkWFeMqiFb6eMgUzWA0F
	JKcF51kwzqky77HX7281JYYbAnRaUEKcDvrUpH2W8hmrb0w1Ggvd0nqMyhaOAy/+bKi0IiwC94g
	E12fiOTeac1eYQTKmvgpWALC9sW7kaIi5ITKy0ckoPLSaWLpcoTs3jt30oe2pseYXuKRlRjL5j/
	a8nrTZvhPvlCq1aFqI/ntq7bPBxu9I26JDL6h1gG2LV/I2NrFUZC/OGKDYhVk8GWILJ+dZZrCdU
	k4e8eaCW8PlcEVJue//tI48VWxomx2yxYIJlGLSn2ubwYZADF9vQ8hpYQEd6ZLm+Y2Pl5gYTcl3
	Uq+aYMkmVx7Z8Lb3jJt0oi0Kqm5iDom2x
X-Google-Smtp-Source: AGHT+IFasP1HhTVqhnuZkW+GMDcgc2NkUjSJYBWWtUuBHkU3lows+k2RPUZ75ndHMNEh3G6ASPvbfg==
X-Received: by 2002:a17:902:f707:b0:25e:78db:4a0d with SMTP id d9443c01a7336-25e78db4d35mr62051075ad.36.1757811757158;
        Sat, 13 Sep 2025 18:02:37 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b20e01esm88107345ad.126.2025.09.13.18.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:02:36 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:02:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v3 02/11] Input: add FF_HAPTIC effect type
Message-ID: <u2g4fikyekkk3yku5aqcntk34zrefg6tr5yaqygrqosr3elh47@oexr2zrxkza6>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-2-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-support-forcepads-v3-2-e4f9ab0add84@google.com>

On Mon, Aug 18, 2025 at 11:08:43PM +0000, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> FF_HAPTIC effect type can be used to trigger haptic feedback with HID
> simple haptic usages.
> 
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
