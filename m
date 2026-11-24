Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529299;
	b=X+chbYgPWIsOBszbYun8INbJlIbXCyWXtM8JhpKku6IOciovtFGAw8pGPVIM57t6053g
	 ySbQBzwILmadR9ZR0Xm5coQlnsvbNi2rVsha/FuJidGsZccMxR6NCcgwjjodob26ihea+
	 neej+CV3Oi5ahCt2iVhaJL176ETwXI/PvUHjLM8/NA9xvIJDFvB0wNy9dy8Ral67dD3qm
	 XWOjUL69L1YVdAu4k/8IEHLvfilXre+1mtHtiuFKeo8w40ZPu1HjEDF+FTNDx4ibIq0sq
	 QmnDvBXGbZA2T7b8yIoodAcP16+jviMc47IydmP0MRB8cguOyw9ZxvGzq9L9buwfgWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
	b=tHQ1i5gF3mzhafDOvtsPbixl6l6GKD8DlpcneqLX/N+t+6bndeSsUgJnhAun7dldYkDC
	 fXPwZkrDhYC0nlilwBKjo9fFg7Nbg53EKSimPAtGyFTRGXj8CBeSEIZwe9WuF+Yk9oLEc
	 x0ghFORRg5yzA13BJFKdTnDNnV3aHk1FLSnse1dhJt19u2QXV11ojcjoWMRcxhIqJd+QU
	 /LmNK1HOM0uWirY4KJzqr/EHfAyciXBR49NGUa5XmcNzIPr8i2bciLhV+v1OBG5btqPMW
	 pTedN7D+aVZvFXmgTnzBF3+tJWZFMluwuudW6UWG/lRiRkTpAEF8cm/Byj7At87bV3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUbEhfEB;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E182606D0DC
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 14:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E182606D0DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUbEhfEB
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5133831027so651891766b.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 06:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529298; x=1796134098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=lUbEhfEBgzS6vFKGKFSIx8aFwnOpFSyP2NjkZKphp/89gyhsGsd4KNqI3I2ZIadB7Y
         m31JgrxDn/SWN3+7MrtULm0E1lvbcRXSW706YN/qayL97IqY89aMDyMNV+40wCwqpOe5
         5P1PbnE7FytUI9lsOATmcCsVTQG4Whip9zIuGQpApc9LgCOrEM54le1YNwAx1QUvfJt7
         QWV6D9Uze300EOVBp7eY77vVITtsacOUIk9cR0y0vq59vWtouZarXBeopX7qB8Hv+vmQ
         ehmQC0vVU7dlTXHShcoFze6qcdOnyXQjJ30Wqdw32dXgwLyF2RYisBNS8b2GC4cbZVRD
         AHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529298; x=1796134098;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=GaJWx5aYUCh+wTTHWHZouMFgR28w0yzd99rBocSPJFs4StdC2PNx7rYHUZpHsvlSW3
         ZYzW0lLxTM3xV8Zz84AwuXGjppFrVBtnDBnphyUIeMT4tdfJjWPSA6jUr7gSkZ4XE83/
         ufVBrnvX6IMsVQj3kP++TyzgaY9WX718Qg+orpQ6CcR3iQKnsQWBu50jQMfwB1PUuUqz
         U9WQTfHW5rn2Bgvuzxsnc0inkm9I38IYffxph+A3AC99gQPDhmDA/f0aGDd6+j8bMJFC
         O50J7y4WF0hoZDIXNiCaKVPCRek9SL7T0KeybKnhZJdftTI6Uhb53fA/19GvAl1gWqAO
         aarA==
X-Forwarded-Encrypted: i=1; AL+hErFFhk2gPgbH5YjE9pKe82Bj3Ovib1M0UED5VabYMbPYqN9CfWyLGm4ug6y3g3ovqeJw2R9rP57yTog=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aVNVn/IN+khuOzioIsf69MVhpGBdlCpboe4GG6YAiTWIbPnZY
	VCgkIKUvDzoGMmd3IwT21qrWtV9iLnq/PPqMnUC1eLiK4Mr6V9U18nHB
X-Gm-Gg: AZFdTZdSk0EMGz30ofpJZWMgN8PH8b9dRv2I5uLrQIYGCmVLlVozjUgAPSLUp8tQy76
	BPwIN2Qh7MBqnYowk1E5gPbnEZ7UPUYPpEc2w3QWa6rFDOwX8yzV36rL9OV0ZOIl3U3Xf76uzdo
	HKQTo9+84kaCqcNUNicOjE65GS5sYGrh3WSjt3ZlSGjeJbXyLvMgNtp+8C7hTZ3YtHs+c99q7ia
	+UFuMq1gIZgac+7HScczJJ4ZmpV3NZ9d2hgOMl4xbkmPe0xpC3VnoTdw8J5wc/YdLwVFbDahg+P
	ZADxY6Q37ayGLJhEqWpxuQnN6mVKOMFlVJSut/8MrhUKaeL+fP3SSxF+AA570BC6vZU+o2FdX/r
	PM03R8d7ODKRiNNwtM7N412ctQyWhrGmhq43vKow3ngzu/c3X3fB4aIwo4/yEDSn0xQO2AxuWoT
	QXPZ5Z2C2ZdNGxyRxVBC7dGAvBoG1sy61pVW6qIedibetSyJlLSch7zDhdemj070IE0PphrYe9q
	7n7kqQnSQnW63Pm34SGqXEf0LKGyYNA1XUBU3Q60kXG2jrl6Xd7RgCwzk6AQM3qyYUIQv3C970N
	srv2XAo4PcmQX3uL1tCSogCry2t9yrA=
X-Received: by 2002:a17:907:3e92:b0:c51:9ab4:393c with SMTP id a640c23a62f3a-c519ab43c77mr120246166b.32.1795529297432;
        Tue, 24 Nov 2026 06:08:17 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea1fd8sm512929666b.38.2026.11.24.06.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:08:16 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 09/43] drm/connector: Export drm_get_colorspace_name
Date: Tue, 24 Nov 2026 15:08:02 +0100
Message-ID: <awWaMHsJ2EAn1Tpa@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-9-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-9-78ace90f4fc1@bootlin.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 06:58:51PM +0100, Louis Chauvet wrote:
> Export drm_get_colorspace_name so it could be used by VKMS
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d66188521881..fbff5871355d 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1528,6 +1528,7 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
>  	else
>  		return "(null)";
>  }
> +EXPORT_SYMBOL(drm_get_colorspace_name);
>  
>  static const u32 hdmi_colorspaces =
>  	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
