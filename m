Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B759122D7B9
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769276524; cv=none; b=G+R+x+uNeMD8iACjIHKq0CWTendh/dfkIEgFuMbduS86xsGHkglr1wpjW55H2jHAa9GSMoW8uIVqaQcSPrHyNuGMv5YhHTHzhkX67GGgqouxk16bXh8SJaGZaU8fyaLKM+0hYueOtdzycQTJ3KN6tuz2dFqlY+zTNUXDWrP2Bz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769276524; c=relaxed/simple;
	bh=EBc05REX281vBJG/8qd75ptDoBPMWPIb7O5pqviqR6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bs8KkTOTVMFDeDeSuXJhudSHKmb9JHkxe7xBGgieS8oGsjc9WOU56LXnKfZDcgyQAFPEpGtOj/n8U21pNS700x1AWPnWWjU+nVlwWNUbGvBnGK6yoccAxl/8813ZLWHyu8LDmRmP0ScflwE+J03pEXT9/kZusuV3p+qGq4qnpy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6a1e6ax; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6a1e6ax"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43596062728so2651243f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 09:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769276521; x=1769881321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwxVrejUO+lBMAe9SgBJs9PZlLotjLAwzjKh+NoaG68=;
        b=h6a1e6axnIl9uasuCe+IoZZfQ8tR9FHExwjXuaLiaDKWlkFNWLqXVGIq8ce7g57C7A
         7dLWhxkl2RZ0Ql9E9ulLuqiSxZpL5FfyV45ZJHXf7BBHCsv301jnwgsHoihBgI/M/0kS
         3xKpIsg2DjLwvk0dURPfK1EdhkUipaWQtQQp+a/H7NwCGkRde9/2xX7RFpQXw6gu1tKi
         SZxQawcmRfX4u5sB9p2sUguwyyyUrTNqgCboNdKTHKG1DmkDpMxADZ/UC4O1XysQNgBC
         myg/+7BsL2Lps5v8LA7P3AXm2Gvsaoq0ygDIUKAHkbnuHw6ebM31vm+a+7l3rtclEUPi
         F2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769276521; x=1769881321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hwxVrejUO+lBMAe9SgBJs9PZlLotjLAwzjKh+NoaG68=;
        b=HhoeDMW4eWuJew6Hi3FW2bYVKILmz5/aH9QHQghlv6jgoHDcDLEElNI4Ce4RcWu/P4
         hArGDs3zJud2ibzv3mF90FH+0frMtlwbaNmAq6TV20Mpv82bGtLoFk+F09+7G4HgfwzE
         bbwyRo+SF1rn5Fg2ZELu3wz5IaVKHhzb0+GY9kLxFZrVy+N6jaW4k056cs10L4YZRput
         IDwA4irPr4obEOVCuxi7n5A+Mn3z91wL1lIc43eylgKae3b8XsJLMRHCLNOXWCAoRfdO
         sIqchMfs0CTYVfkwf8k1RMD4rpxb8c6qGN0N4GEbI18vMie85S+tRIWnWFngD26Tagzy
         AWww==
X-Forwarded-Encrypted: i=1; AJvYcCWb4t44hRtoP+0tph8D1kfFj2HN4Ocs3kCmhxUyK+hh5qxrNcWvZ+uxFAIhASLMPJLEcSjBrNFz3vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEIQ0llQWb501kFK3fzWIs6oaCzo8ixYjltFE2QVKw+QVFfgCK
	OzfTpPR/XXX9Ig3hQ14x9SfJS6Uw66lg5E/CaOlTXtabnPyNVPUWJa+p
X-Gm-Gg: AZuq6aJ5m0i437t5Mc+k92HnTSh2iyIo2Nv0QdGGw6X1hH8wN9RAc0fQV/oS2C0OKep
	1ukXSa9oNgv6VfXmbY6MIwgt8ISQaT0HMneyC+K1wBta7iUv/dYoc+NGCfuLI6nCPJaHaCVKopM
	RmPqv4Bz4GQtavviweDwM+9J4uMp9B/lO4RAGZ4TqGTFSmC6IdjzJB+5dZOl0ORjwPpaZW2P+JK
	2dR6D0k+6Cb1F2k1emyYD0ATyVPBOzkD3D9chSD48HPSfEJuWJ/FEU73G3asa6sCg/3r+XewWr3
	dC3pGdgW3/DSq1SciUEfQU3UctfU659wWXjuCnhn4iVu+cRKNpnaJ0YRzIMVn6fW29dGFjzLS8H
	imrv3LxeGTteiVdC9QO94Z3cAvIpgCtjP6c9L59HZMcho9PFT2b2YfkUEYzZj/zfRsSlfml0EM3
	DHiBKl9YjH5/HeERGUSA==
X-Received: by 2002:a05:6000:18a4:b0:435:9538:939b with SMTP id ffacd0b85a97d-435b1ad3727mr11730610f8f.8.1769276520845;
        Sat, 24 Jan 2026 09:42:00 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-435b1e7164dsm16037107f8f.23.2026.01.24.09.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 09:42:00 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: hpa@zytor.com
Cc: brauner@kernel.org,
	corbet@lwn.net,
	jack@suse.cz,
	lennart@poettering.net,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	systemd-devel@lists.freedesktop.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH 0/3] Add the ability to mount filesystems during initramfs expansion
Date: Sat, 24 Jan 2026 20:41:50 +0300
Message-ID: <20260124174150.974899-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260124003939.426931-1-hpa@zytor.com>
References: <20260124003939.426931-1-hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"H. Peter Anvin" <hpa@zytor.com>:
> At Plumber's 2024, Lennart Poettering of the systemd project requested
> the ability to overmount the rootfs with a separate tmpfs before
> initramfs expansion, so the populated tmpfs can be unmounted.

This is already solved by [1] and [2]. They are in next.

[1] https://lore.kernel.org/all/20251229-work-empty-namespace-v1-0-bfb24c7b061f@kernel.org/
[2] https://lore.kernel.org/all/20260112-work-immutable-rootfs-v2-0-88dd1c34a204@kernel.org/

-- 
Askar Safin
