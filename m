Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC494363C48
	for <linux-doc@vger.kernel.org>; Sun,  6 Sep 2026 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714211; cv=none; b=aH9AutcHNZit0ni2orbelboZUXG4kj98Z1wSrQcUrXVn0JBZ78eSx9x0QcWDMT+ToatX+sS+LKCj9/TO3r0Z43lJwJMBBS8LGXAqG7g9HJsHOaiYFpynXUCDBfB+j9I54Qjfn138R6r8SpUlGQ715Eg4JkEsf0a6OhJnncs0u4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714211; c=relaxed/simple;
	bh=3nQdtxw/p3KehznPyVdjNN8kTVqQcOVVInmE6Fspmvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubZQ3AtFSX8hd/R15WtnRihFNEDy9EAfbhfo2bnxcwNJSnqdiQl5EK6ACXMeD7Uw7Fx7opw8JE07GaQDl+lYkNwdWuLZZm/751P+x+jbyrdIVm/+zqmxMJug7h67eV/4RAWZ0ouK1GA2K2zt8SGrHzj0NkhmImBqnR2FR7XLjCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=islALXcM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="islALXcM"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d9201076b3so31293725ad.0
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714210; x=1789319010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WbyKgxmi/08EG4pWqu0vnWSWMfKp3Bgy++/kX1RtY/8=;
        b=islALXcMkeE19kDYnyctCkZOazjAyEgafus2D+wqdD2hFX4Cet8ObCIBUIQwTdHc7K
         frBUckQTayhunRYMV8xFGbZj3h0yFFqo3K0OIKeVMt6ikKqi4R9ZF9N0MfZC5rM7JBSz
         c4STraOypxKYcH66L6XHWhw97FWfeHG1K7aUs2+9MHPOGXZfNWM4XwAfSi+5f8JJ6o39
         FFsLRAYMX0SPz47WkTJrYmL5uN/1yntMWFaaxXo79EdEw9u7UCMEuHboT7127AG3PqmQ
         K3zmFM4xwanJgEbEZVKZ1WjNGx9+73RbCixIGeg+wUcs1DzSkQnBsam9gvNzKSHtdkPU
         xP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714210; x=1789319010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbyKgxmi/08EG4pWqu0vnWSWMfKp3Bgy++/kX1RtY/8=;
        b=Hc4ME7+Imtr/SYnCs/iexpBcdhXhqe2Rf52x3xSHGv2N23CG7wBjfrpaU07VMj+gqL
         6x2QQQT0kRs+nS8pEBd7bth9/6pvv4zJfRdweJgUgqRSNxHMKfnqLSTXJvgVmCA5COu5
         BpHFLPvYZw064zXdV0R/8yR552GiQN0Mbc1YrepSEsM2PbgedF9sDO6+Qi2hOvepddvo
         hETfArw/kkOkSdsGQXVuHg7/zWQlocstT23bXzTqV9DSa7xYjfxyBaR6LtxguCsu4O+1
         tVyByjyWi9W7mjug8d7gtdwjvwwdpJqA+jXwPs+9fqoXpOG8e9011US81W/01hKqc4oO
         g73w==
X-Forwarded-Encrypted: i=1; AKwUvBx3wISO2dNH86vgplDObv4ySkoOIV8SqCqwUrJUHZa82d8zb1ApBVkOKRmdxWQ93gI3AcDi+yeGALA=@vger.kernel.org
X-Gm-Message-State: AFuF++nX0JzIseXfhRcPivUpyF6bl7dHgWiAsWeJW9QP5scsOsco/+r8
	UbMi7khGIhI6r1En9NP3//+gTNpDw4FgagKmEhzp+HsNPmXaPUXDJybx
X-Gm-Gg: AYBFou3ZgggDAvvaqZny15K62oIwHdS8oXxhca1snNSSkd8qYlJLB92qSHalaPuDTrv
	E4TzxqbHQe+vfAXA3gvQtPGSMa11Efp3/v1sAqRVuh+PFk5BrqfolzhUKzidl2wkmGAFRPldd3Q
	ruqI+oCy9M8qDwK3ZFZwqJN3/D0g9vz7MkRHu9ruM7gokyVZhnmWVgU7ri39voEu9tCN68Khj04
	euGjA85K71d4TZ+oSvcF5tD7Va5oBOXY5GjdpWg0mkQf/zvIexymA5D9b7bjTEku2QN9F4dPkpo
	+HcUCBJs1fjR8Mjm7TRlKt2WU5V5Ak3nBQeKYMxcxk1LsJmfBGt0CP7RcAKOEt3wko2ko1nXJf3
	Z8XEuVa6s8d2ha9dO6hxONF7Y/bqBmKrBBzublDSOO+pYUKuHrdQY40SAeia/7dbQJ87OKK4D6z
	XQZxc+Fwvn2eb1IIGsNPVt2ktHGtQXQgWPHXq80E1kXK9OT/Ihw+vBgTVyRtnncgVXKZEyGHGr8
	FI=
X-Received: by 2002:a17:90a:da8f:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39b26208e7amr26267464a91.12.1788714209868;
        Sun, 06 Sep 2026 10:03:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae60891b2sm9330813a91.0.2026.09.06.10.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:03:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 6 Sep 2026 10:03:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Mario Nuevo <marionuevo@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z490-A GAMING
Message-ID: <ec1e36dd-3128-42e0-be0b-dcb7c7aff303@roeck-us.net>
References: <20260905080346.1957380-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905080346.1957380-1-eugene.shalygin@gmail.com>

On Sat, Sep 05, 2026 at 10:03:36AM +0200, Eugene Shalygin wrote:
> From: Mario Nuevo <marionuevo@gmail.com>
> 
> The ROG STRIX Z490-A GAMING and Z490-F GAMING are essentially the same
> board apart from the F's onboard WiFi module, which isn't wired through
> the EC, so they share the same EC sensor layout. The Z490-A exposes the
> same EC sensor set as the Z490-F (chipset, CPU, motherboard, T_Sensor
> and VRM temperatures plus CPU_OPT and VRM HS fans) at the same EC
> registers, so reuse the Z490-F board_info for it.
> 
> Signed-off-by: Mario Nuevo <marionuevo@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
