Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0523C3BFF
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269441; cv=none; b=BQPFS8yAzYnzQbEa0VArwviNYmd/03EYR9F9nscHqEiXE4fQk2z1C4+c3foJS/y38Jp1z5HB3D2wYakDfq3lEnW0gJDq1JVGUjcWYRfDdC0dnql2O9vCl1uUDEj8OOYOPyGh8aR7bIS3Ziwv6Te+Q+d2j4c6HJXnGECk1wf4D/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269441; c=relaxed/simple;
	bh=k+sFTi3ZhgfW4nApYetJ4lkoXUIXd5mBZUzjEevdCnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atic8duTkm0Z7zZGm3Ft0Wgb2Ytdd+a0IAXiF+AyLEx65nrODxskonIbHF9j9pRBN2RiUOBkdCoC/rpZtF4I9WA8x1ZNO0p17bmoNc6pDgkk8p6GqTnl4jFl1f5HS6IcIUtXfR41WSNjFk8FXdu3ZHNShpRL26f3D302MlTEx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K5b2jGNs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K5b2jGNs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490a76757e5so7187825e9.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781269436; x=1781874236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yf7j+ifXP1lxuhE6FFlnHvjVP9/k9ur1vllpVoVtwAs=;
        b=K5b2jGNs/84o9wYeZ8dcDLfOZon+oILCookbgGaw+tfmpx8HVSZlc5jDwXau3sAN32
         fWeJrSp5c0piUA3z/y7co4i3WmkcqeRZja5wqVXsqziCf4roaDgKDJTWcj0NohdaD5BU
         uwM/SprEBsYXQ1lpE84RTHPCtDOQLDa91CREfgXiYiw+x28mSKNBVeBaWw/r2a2EpHXq
         615j1HJcjMkqaQmK9j2VBy60xWD4frYUarAUae5OeGeXhfT+7AE4NoAVMigQl5gPNFel
         AGDrfwTSd2Xz02gepjU/9OHrv3HvXanRYNyMezoaDPfLDvyoe96clktxc+KzxUMOHt/b
         RY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781269436; x=1781874236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yf7j+ifXP1lxuhE6FFlnHvjVP9/k9ur1vllpVoVtwAs=;
        b=S8armljKT5vfE1/V8ucvjbNEFYy1cM83s91WUAWAQ5ODAxGTlXxWMsXslMXQlFIaLN
         1X9UTimhhb0J/QWYk6Upy90TmllWFu+eMezA/HmN9dSWp2IqKF8N6iA5E77apbbLI62U
         o7/MTnqWfSwjSsuhR1VXlKmdyWc0Ga7V9b2od8xFMIisX4ADcAdOqu6HBRvjZKBPzKke
         yVPc+q4QNTsetEChljtR8FfTBu3izOvovI1+CMFuxsbqYR3aEsTChWZWeZGUu7FmtTag
         /iU8rjgUyZwYfzMtjOqjwDAvU6+igppV7ZJDZvO0cA4rljtK5xUYxxxnrkvTTZeDgSBW
         zRAA==
X-Forwarded-Encrypted: i=1; AFNElJ+jCdkTA2kaPKMwbqfPALOvboDappincwXV7Pvve2b5dWLEF7677xgsPkPvLla6/Bix7RvlhUZvV7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx32ZN2VjISMVPj6y/8e7pEGwHTbDnhpkVhXy3XrgUTkdp1wxPl
	0m3e70SNJkYRNLJz+5b2gUtDwQoyzgYnsRO+/CXdEZkLgOegA8hL032rAf9HGpabi1s=
X-Gm-Gg: Acq92OH/CMlQMMHK2RMSsc+pOp8+A5K/DnVpKGtrqe0DjueS2sXgL2+1hdex9pUY3xU
	nBlPP+oU6WValCM2JrdrTw5XPaZHIuQRZAmv+2dmbA0iQgx9m3RlepPLWXkY0S6tmndeOnm9jAw
	OSydCW4MG1MTMWDpkiSwMqQrMixoWmCRJnGCXEkrRbJB8/fEN6fbVYIhEklKb4bCfjip7kjK2TT
	pL+UwVs+yqUjfsAZPTz/bUrj4XsddNG1cAXFrB0x4Npefn1L8xnpeBf+UTL6uMUhSBUlJwGPGpK
	xtXKdTn8Ig2w1ZUK3mjWrgBpU5Y/UtY+2PqicO7pknnWvytKs96zZnBZ4ndVPXINmPEp3DUXxVG
	z13Zwi9m1fE/lBAFg/1Y1Gk/4nVC7vZjdk2Cmn8mxp13WmnJWOTpmkag4Kc9uwrzE5yofl3COF4
	ysGvFbb7lbS6qE/rSz973/WyuD/A==
X-Received: by 2002:a05:600c:83ca:b0:490:aef9:aa3b with SMTP id 5b1f17b1804b1-490ec523ef7mr34427875e9.32.1781269435437;
        Fri, 12 Jun 2026 06:03:55 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea84cc32sm61170145e9.15.2026.06.12.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:03:55 -0700 (PDT)
Date: Fri, 12 Jun 2026 15:03:53 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	"Daniel J. Ogorchock" <djogorchock@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/2] vsprintf: add upper case to %p[mM] et alia
Message-ID: <aiwDuXJSFtt9jlyf@pathway.suse.cz>
References: <20260603104351.152085-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603104351.152085-1-andriy.shevchenko@linux.intel.com>

On Wed 2026-06-03 12:34:01, Andy Shevchenko wrote:
> The first patch induced by Sashiko rightfully rises a concern on
> potential ABI breakage. To avoid that and allow the user (patch 2)
> to be converted to use unified output introduce %p[mM][...]U for
> printing in upper case. Tests are included and passed.
> 
> Changelog v2:
> - added first patch (Sashiko)
> 
> Andy Shevchenko (2):
>   vsprintf: Add upper case flavour to %p[mM]
>   HID: nintendo: Use %pM format specifier for MAC addresses

JFYI, the patchset has been committed into printk/linux.git,
branch for-7.2-vsprintf-pmM-uppercase.

Best Regards,
Petr
