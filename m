Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DAF4A64E0
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413929; cv=none; b=MxKgakTr2Vw53K8KXYyImj3qkqV3EmpxMWYPiFkZPBvYJmwX3hUk5wlXc9N+PNGib7Mu7RM8h/s1F+T/vZdQw7eFPyg7vnTkS983tjFHecvNhJooYQFjC/xlPctmZsLsO1bO3rv51aKGBx92ams3sIshScJLnksPWW2pY4OGCR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413929; c=relaxed/simple;
	bh=CxFwB3NB1ukGlnP0K4LvgyQtIKLtXdStrK1ZRzGD03M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjRR66LgH9Pk65+1aExKTxHCoE2/o9zucPn2dNZFSDV+gP/RUznnuQwOS9UiA4c7aeX1vSlyJIqG2LJTgF4d/0PeImFWVd8q7z9L8rpMrRX9zV51TuZEzRjXUrJf/5UbpuR4Op/4MAmI6x52B1BUGG9vMKsGBkqtIOFC4yLvczQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPht6Xb6; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPht6Xb6"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6008938eec.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 05:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413926; x=1793018726; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oo5b+mGdxcUtc+pXMAzRoUpMwm26Steg70hnsQp65WY=;
        b=FPht6Xb6VGL80aGbNPAdBRfg/sudz7zEXFdn/maPQyhp1O+KKMxdmAQbjJwcqeLNZg
         o4mALJTQy8LB1Dz1FO0sQ4Cx0RadQfRWF+Jgv7KpUQMQ3aPyvpmVSKz85GbQEuguxWSb
         2J/v1VHU4AXTGFy+9XBJqqCGZagvOpfxPtSyyFRfArrkvgALgeZTCi4IowJ20HA5Md67
         4Okr4Amtr1U24fm+cN5HpP2o1B2c82coZ1luUpQzeFZ1vadFoXjHSy5qW7R/EGHJKcqH
         Y/Mywd5+EKryOLUh9ji0lgVjI6FywcLU6/NIThxrngY0zd0bbzQkH+R1qlZMVsJha9Uq
         NY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413926; x=1793018726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oo5b+mGdxcUtc+pXMAzRoUpMwm26Steg70hnsQp65WY=;
        b=x15+bnXSywDjV2bavyHtIHvSDd9Q9vw9ETpNEmAJBkOLVwIraVEXt7/iRIqrOR/Jap
         ifWdPDOFheIY+KPvzVxd0ll3f9DY2ytpiDboJFdLJmKyOD3dwXRWlOfaUZWoTisb0nKl
         kkPO7ioOwTzBLbhJsTGf2x7ArrjW5BPslJUzorSMP4utjlstuT2bXbT3hUmx0in03k0J
         ChtAgXOWgcaw7HaPWTjHkInw3I0F+in+D9TNTcdWItU7JTHa9RPg6lRx7uRUWcGoCyT0
         HL1PgL5OcmNBejsudLjXlsnZBST4rs2ls67NyGAdcp1Ie8mq/lo7w/81RkrgpmblNN8+
         wgOA==
X-Forwarded-Encrypted: i=1; AKwUvBwLoL6lV37O8Q8/BwM48dvSLaw5Q+ZbTpb/4UYCN3ix96+N2xlHTiAYAEoeflMQW8/inW/pGvRR5/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0FAeGxRbG4bJf1r6WPWkUBJfbwfYyCrx6ZhVszzIcXobyLhW3
	lIve9GIbO8FVUjinDXvX7+OWpEUu+TZWnvKOHQjdGezqbej7O7s5zg5C
X-Gm-Gg: AYBFou1n5tZtUcfhEjFnwLSjMEbNcV5801bri8vPCBBDVENe1JbTUtPwG4SBJd2VteU
	pfvxR8QWCAWUqW8GfeVBeLRaizs5Zvr+yjOt8Lzh6cZalybNTzTNhmWilsF1lPB72RA6GUnsnXh
	sWGNC7a1l70qzxqswPa5HS6Li/UALdtbi1gy9q2E/sHzeihxf3fnK0WEEcREfrRrDc+xhGIOQo4
	SVI1QniFGB+S438Ad/sGREb3sDppVNitAUHJoXZxJYA86KlF83UwJzDoE7OD86LL3y+5kNxWJhk
	c60CjfRJnpL8H1XI4YKwkXP1BfdYY4zpaJByBIaCZjVx3oSr+8WNaLPDCwVga7jpEzJ5oQ5hdIp
	Q36BtRpMNdQAxmNHXzIXqX3qQlD9S+y2rkKwuxJzLc62515mZ5B+hM/qha4/Z021/ozuclNZaAK
	dxm+F5gIXK1dKmMn8ducCoDJgqLJewLy5HdoktqzhnzSd/tiUsdKJ1C2mt8DsgdoTkPFmROm/vw
	L0Xt51wRdK7
X-Received: by 2002:a05:693c:8107:b0:358:1f59:48c9 with SMTP id 5a478bee46e88-361a1f4a9bcmr12517584eec.24.1792413926068;
        Mon, 19 Oct 2026 05:45:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm59496695eec.24.2026.10.19.05.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:45:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 05:45:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Asaf Nuri =?utf-8?Q?Bertizlio=C4=9Flu?= <ycistak@gmail.com>
Cc: linux-hwmon@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Document sysfs numbering and label
 meaning
Message-ID: <57ef30df-052a-4189-9000-deccaba6c117@roeck-us.net>
References: <20261015171759.704526-1-ycistak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015171759.704526-1-ycistak@gmail.com>

On Thu, Oct 15, 2026 at 08:17:59PM +0300, Asaf Nuri Bertizlioğlu wrote:
> The documentation says that all sysfs entries are named with their
> core_id, and that the "Core X" label contains the processor number.
> Neither is accurate. create_core_attrs() numbers the per-core
> attributes core_id + 2 and always uses temp1 for the package sensor,
> and show_label() prints topology_core_id(), not the logical CPU
> number.
> 
> The difference is easy to see on hybrid CPUs. On an i7-14700F, the
> "Core 4" label is on temp6 and belongs to CPUs 2 and 3, and the
> E-cores report core IDs 32 to 43.
> 
> Describe the actual numbering.
> 
> The mismatch was found by an LLM comparing the documentation with the
> code, and verified on the i7-14700F above.
> 
> Assisted-by: LLM
> Signed-off-by: Asaf Nuri Bertizlioğlu <ycistak@gmail.com>
> Tested-by: Ximing Zhang <xzhangjr@gmail.com>
> Reviewed-by: Ximing Zhang <xzhangjr@gmail.com>

Applied.

Thanks,
Guenter
