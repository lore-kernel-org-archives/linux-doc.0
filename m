Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HL7teC/d"
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827D418E
	for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 09:49:33 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5bde80aad05so5653428a12.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 09:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700070573; x=1700675373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rD3WiIjcHVWht+bRoyz5WPCyUUboXlGuOAtDZ7BuR4Y=;
        b=HL7teC/dFsL6nhWGP8XRvC3I1hAH1404skG3QW+KqliDXcK3kiO6YDQ3JnutiTzpNa
         MDUFtqnMl8mS5Rb0XdsPJ9uXJ6X1zmQqu/hCDJRYK7C0Nb9UVzBj2YADferoK9nr1MZ6
         DtnJ93aBiqq8q24OHqy/JNRcz6FbegsdyNd44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700070573; x=1700675373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rD3WiIjcHVWht+bRoyz5WPCyUUboXlGuOAtDZ7BuR4Y=;
        b=AIibCMZ4RnGw+9ytOh0oDDQ0bWIHrAdTevJa5w9WEPDFPJst0wTfYIVmtc0w1lkHNy
         PLz/Dyzv8nJ1CZ+1seagRh5dOvVwtjcfodSNzDxt5/49cbIZttCFFJYIY9eApK98JQnS
         mJeUx7zBuBTtYnnMh6UnVAlrIYZcfNXknfIhmV7O8p3ypFd+Ej+tiWA11cVAPRw1Pm0b
         RTT6BoMPHW0d3i1nZcOUq6jFTA8nI/zpyPseBV3aztwA//hU+IfIo3FP042SiYEykdWf
         8CA/LaFV8uLT5naquNM+vv4awKhldDEBfu/FIPMsejYlozSUbkJW5wcxlfga02NriNR+
         HYaA==
X-Gm-Message-State: AOJu0YwrpA9+tH4O1qi1nq2W2NT83uA9RWw4tobtxEnU6TuT0ZrzhOyv
	mOTtqTUab5bPxCeqdU7vyu0JtA==
X-Google-Smtp-Source: AGHT+IGpmlqewDarAywsnMa7n04xYqUuCS4rlMCE2QKXA46apMCUxu5GyilgrdJ+vePrD+IEy8Q6pg==
X-Received: by 2002:a05:6a20:7487:b0:148:f952:552b with SMTP id p7-20020a056a20748700b00148f952552bmr15559858pzd.51.1700070573014;
        Wed, 15 Nov 2023 09:49:33 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j16-20020a62e910000000b0068e49cb1692sm3068013pfh.1.2023.11.15.09.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 09:49:32 -0800 (PST)
Date: Wed, 15 Nov 2023 09:49:31 -0800
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: submitting-patches: improve the base commit
 explanation
Message-ID: <202311150948.F6E39AD@keescook>
References: <20231115170330.16626-1-bp@alien8.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115170330.16626-1-bp@alien8.de>

On Wed, Nov 15, 2023 at 06:03:30PM +0100, Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> 
> After receiving a second patchset this week without knowing which tree
> it applies on and trying to apply it on the obvious ones and failing,
> make sure the base tree information which needs to be supplied in the
> 0th message of the patchset is spelled out more explicitly.
> 
> Also, make the formulations stronger as this really is a requirement and
> not only a useful thing anymore.
> 
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

Yup, I wonder if making "--base=auto" a default in git might be a good
idea too?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
