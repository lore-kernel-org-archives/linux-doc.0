Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D083434980
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 20:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985612; cv=none; b=cXgVYw/0b4jglWNonm0R9ot3HFlk9NInt67Lyr3GD1UwxJLZvHfPYalrVu8rhpQj2hUUIUfUQ+tI693Pab9kX1DsLmqcycBkjC4JG4DOECD9Bb1G5x8zzWaqRNMYNlPjut701v2UYPPRWJdggzRyeoBGyc7RBtW+F62KiOjs2Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985612; c=relaxed/simple;
	bh=0p8Nkk2uR5bJct5mDj70pGBOis/omuOo7vuJrgv65Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIGfLMT9Dz5wUJ/J8iMDqzqypJoW9FANuLdWKgIIbVtgYpcgqkB1gB1yHq9e1wlgzPwBn6EPjZnDDYPseyC8ZlrOdV/kaIi/xX4NCNY/keKD5ikpQVr5O//xwo5SMIL+p8CpLuMf4djecxwXQ88W4AgH1FsDQQhgg53xoZBvwJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AohOgggQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AohOgggQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6efd73032so2746815ad.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985603; x=1789590403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0rUy6QUb3FEaeMughMRFuqCqfaHGo8kxiuvRMxxUU30=;
        b=AohOgggQ5aKgD4ZkgxVcEE+fpiUWut/XEwN4ZefwAqF2tJMDvJmFbw2u6kMkQdMP/p
         EiCMDLZl/6CRcTagFPiboGekl9cTt9AL3yGoyy/B5w+l2x+rXzXKZH6/r0Jv9Xc2Z3pi
         Xuqq5Hj5otbjR1ia9cfAWv0IcDh1m+7mk/SwkHGe/rfj9Wwp+0ckBwtIpI1prwRXSbcb
         H0DpydB6uKg1gSbtSgplpW+LvDWaYBlUlzkM0Jk+fQzcxGlZXfs6n+92wY2dKilOHrq5
         IOBS9kfebFvNMszjaHxB9wZz4ZM1cK135TuTfmY8vH/P/nLANeV/v1Bgr/zoAuqn3ltB
         4yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985603; x=1789590403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rUy6QUb3FEaeMughMRFuqCqfaHGo8kxiuvRMxxUU30=;
        b=ELlEcetXQVYWc6aFPOsc94/NCGbgbHaxpavsTpiu2zHACHZ03GjtDrkzRokXUsO14F
         GV4DGcVcwHWQz7jtzEmKrDGPdYOLpDbyo1wVxLVDUwUMFDu2eG7sazaujYGweoa6VM+1
         b2GVel4n2IaRu3P+r7QqnQTGZQWsEHtAPCeWYeSsOe7GO0CiH3u2nm2lTsIsy733MPOq
         uoFQAVujxn05cCevy9Wf7l1lug1nTNiR2peeNnWdU8WbyaWUT+Z8O5U+bD2ef3doIQ1O
         XLhW32FxK9Q5KDy6k6p9A2zywP9XslXu1ko5HjahXKJepWpsYWpOAxqhoXq7kediZFVO
         pcWA==
X-Forwarded-Encrypted: i=1; AKwUvByQNeM0d4iAkldyycZPCnzUnRtqN8c/25shHVgynPOOGh15rEEfE4q5eSlydkzLwGsGEdCGkYLCevw=@vger.kernel.org
X-Gm-Message-State: AFuF++lUbz8+4tffDLWrIi7z3Yoj/PbA82VjY3lyjMX2pkkoQsMvHKjJ
	NyJ7OtvihzqIlDBlJBPIJ6xm5PtqoSeiz4sdI3np6l1V8mSmm+T1SK1U
X-Gm-Gg: AYBFou1hw6JQ2kyQIyFOZ21VbrFJ23xQT+NtwG+pPkoJvdyxkOWtJXtXJ/2an88l7fk
	Gh5C5Ai83ZqGFM4d+a+DJMV/Lta8PoxPUW2vcRK4Sxm3UThetu5X19xvDUlgu7+Mo4P2yL/3tqa
	G8wiRgf437vqa/+vqPyxV9MjL2jJ0u6fyO7edabdXgULVMKWny+lK4TCFxSlSAJ3uK97hZnf+Nz
	50LJY332fv3NAeY/XjZhCbzyDAmR1XOgZOfg9xOVk7FHhkVQxPi8/pzn1xsLrhfopCG0gmAtrTX
	RlXgd5Ql1dSqqySfYnWCG+ZIjpZlho11Txr8TQ4/GdxVqDCSpH+DSPVTBBmZbLKqKQ0eNVFmUyz
	wYgSa4KIeOmNNue/H6Lbv2sinpv8cRtdcBCmRKx9i4Wd/4WG/9PptHKRM2BqPJkPZkL4aRcUrop
	zo7uQAcuNxlzz6+9NNO21roIGJBx+rsfAlu7SZx0S6Wl1oWpHDsgJ1Jhyw0nUyuZFCwt6yeyBzn
	yBW7KwbvbNI3/Ui43l2AaU=
X-Received: by 2002:a17:90b:2f8f:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39d779bd533mr1151278a91.14.1788985603264;
        Wed, 09 Sep 2026 13:26:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77608fb4sm1175896a91.15.2026.09.09.13.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:26:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:26:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: hwmon: (nct6775) Document
 NCT6116D/NCT6122D/NCT6126D support
Message-ID: <6faf5d14-1698-44fc-b4d3-492f567c6172@roeck-us.net>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-1-4e85615fef10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-1-4e85615fef10@bootlin.com>

On Wed, Sep 09, 2026 at 08:25:54PM +0200, Paul Louvel wrote:
> The NCT6112D/NCT6114D/NCT6116D family has been supported by the driver
> since commit 29c7cb485b32 ("hwmon: (nct6775) Integrate new model
> nct6116"), but was never added to the list of supported chips in the
> driver documentation.
> 
> Also add the NCT6122D/NCT6126D.
> 
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Applied.

Thanks,
Guenter
