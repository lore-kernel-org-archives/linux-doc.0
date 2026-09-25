Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD4B3D0938
	for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345094; cv=none; b=F+WqNsNdphLwoxFJZ6drIduiPgmnEcBKpYr3ClUI3ieGqQRlhaZebROeAsp/1vlwYPQaS1Ioi7Q+OCo1pgwEGKGWrOCdaVXRJ+5Upcef/O2955PVFN3Dj2WQms1D4i9pNEyWIu2Ka8nuEyzVuanavU6VQLHOw2enyECal/Lb2xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345094; c=relaxed/simple;
	bh=bbmOrdULgI/qG6m5ZYiQCPi7tLPM/ObVmBPDGixfQGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aksukGcbQjY37Vzt+eDaf2AUvwX4Jq1yj1TNoT2jCIzv7f8FyO5Cg6iv96byTiCfEwDvMj9lyonTAbfXNb9QEByEuVXZlV8vfwE2kzmDAc3jqSJm5uzd3/QvdKlKZJNLlzTjLn8b8P5IC4tvg6bsvwK4iwBr5NI+x29FEZN+gdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYvsOqop; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYvsOqop"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a0b0fa2055so550581a91.0
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 07:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790345092; x=1790949892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ovT80gQ2vK9hf0kYJwc2d02kOlcxj5fWOcjSmSVAXmQ=;
        b=BYvsOqopSQADsn+SQNeWEneJ6Iz4pIokMim1vFm8IubKN49fgy8kSzHS7xRq3Pga1B
         jRU4FhnBQ0qJBp1tt9eU20DgU6Esgq3XLFymMWYaJkaq6jUhmgc0LAmv8LUyQr4gra/y
         U3eWrHbnAU/mUHlpM3EcIyQ2FtcMhejVD+kSLGDhtJ2P5Z4kbTOxjQtXIaBZnf+4u098
         qeuhuGm73Atku1b4LxcavTUT66ZP+ryl8L0co5KZ/q5aOIN9PxEBV/noVVCDSxSK4rRE
         5dd40JPVIaa2VyWYISkhog3Vj1SGEFYuAbPaKlLAZgM0t/+SA+CWygz9J5AlEDR69qJi
         MCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345092; x=1790949892;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovT80gQ2vK9hf0kYJwc2d02kOlcxj5fWOcjSmSVAXmQ=;
        b=TITp74k7PKBMEBVbGRKb2Iv8CQFFsUM4qzwvr6ASG1cnfEAR4P6N2cv5wxpSOnAmTx
         xF+kse3iCHFhZ8iz68b1HGy+C5S7zgIj/FEqfjS2yep4gHC7cee5lnzCC14IMpYRCpO/
         yhojshSadm6yKQfRdcIz4NVOlCMZXMzRb+h/hg5llf+aSBXuoEcEbKB36J4FkB9uyf3d
         eAmmkoKUeznLeqon2+JKi7Dta/2lLRJyOyIuHH8huC0Cb5I4g9KWP2Be9PJnHXgMAAPL
         34jJI6ZjdLpoqbIA7Zls2W5uBOUpmX+9YznibOGGicm7WCv1VfUVfBW61rNJ22re3RGn
         Qatg==
X-Forwarded-Encrypted: i=1; AKwUvBymJbIz6aFUwosr8EU/m782DtrxVNrQGoX8hMWqjOpzbCeB9Ypun638rqK3prctI/Bz357QMkhMlVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lod3YWl6TYPuMRXac/KIvs7l/vKp5hL6gezsLNvA+c5Fn3juHJ
	LL9JrRdXmAlW2vXQ5jGhS10DAwsku0uACqrVuuDmDXA55XFwvD435laV
X-Gm-Gg: AYBFou3nPaAM9slS3pflDWcjkqdUdWS+YQ2YWLGb7QaIXTV94e58TLlQX5wWy5z/cdz
	OzL9o1PusArgUaVBuRD60DGvmvwxDGtFOdEvDBK2+ymxzKj62SMOGdKQwQIwxKotD/KklOR++Ep
	3wG+gFUfu/BoithV+/aM+EhSOe8WpkCbMsomTqZTdWroJ+cx5PfeIQrXHYHBZ+ideySD9ijmC5X
	uTCEfxlBUCedmVRK8Z+3HaONHf+ZVTzeWjCFPC4sqvoit43y0hSG5HPnebgb6Ac/7oMrvUfWj69
	ci6QusIc4gVsJ/JPGQ9nT5c32fxzB+aziMGBxTwMmIzyg0qH4rf9eB+Fi+s/1lO1csYPNJ8saqg
	1HT5z/meu9lxEn72RC/UvGDjDDI7irp3mPfJl/H6J0pJ4o5ZyKHCPD9/rWXsZKzrwHUfuiLTT8v
	X0RxT8q5h7BYvlLQ+7fjkcRgtXUMEVnecJbMxVAhUAQWlT8D5W+6bSVpL26CpqeHYNhcirGQvTO
	JlmXG+Iql84zOtp5tJGeFc=
X-Received: by 2002:a17:90b:3908:b0:3a0:c276:1ecb with SMTP id 98e67ed59e1d1-3a0c276224amr1313125a91.15.1790345087406;
        Fri, 25 Sep 2026 07:04:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09773e7c3sm10983338a91.17.2026.09.25.07.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:04:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 07:04:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH 2/3] hwmon: (coretemp) Read TjMax only when refreshing
 the temperature
Message-ID: <94dc8122-d6d7-40b0-adde-5e0cd7b645e9@roeck-us.net>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
 <20260924-coretemp-temp-fault-v1-2-1884f0ff97d5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-coretemp-temp-fault-v1-2-1884f0ff97d5@linux.intel.com>

On Thu, Sep 24, 2026 at 07:33:21PM -0700, Ricardo Neri wrote:
> show_temp() reads TjMax before checking whether the cached temperature is
> still fresh, but consumes it only when recomputing that temperature. On a
> cache hit the value is discarded.
> 
> Discarding it is not free. On CPUs that report TjMax in
> MSR_IA32_TEMPERATURE_TARGET, get_tjmax() returns the value it just read
> without storing it in tdata->tjmax, so every call reads the MSR again.
> That is a cross-CPU call whenever the CPU owning the sensor is not the
> current one, and it is made while holding tdata->update_lock.
> 
> Read TjMax where it is used. The value cannot go stale in the meantime:
> bits 23:16 of MSR_IA32_TEMPERATURE_TARGET are read-only, and the register
> is package-scoped, so every CPU of the package reads the same value.
> 
> The temperature reported to userspace does not change.
> 
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Applied. No need to resend this or the previous patch.

Thanks,
Guenter
