Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBCA63D6
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="lL+VJACh"
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D97CC
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1698047649; x=1698306849;
	bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lL+VJACho1UvWH2TpvqzgGk2GEaCmjd2Cy0LlMg7A0/M9fARj929MAo2vaP+Dns2L
	 UszlbpoHPjzn0iHan+IL6h7UGH5F4TREJFPUo7xUZaXQQZZ4RJdpQjPFCUDS3Jh3La
	 R5dnRt2NqZGcxI4wYqOUm4U/e3Y1RH46n9DBDsJwtrclJko6uyb22CHp8VJe8BhPcb
	 VbtRca/sGejOsaUxY5JbR4QMkuj2dq1XoNQZOdJR48hREt0o1VtyIoZ2XvJFwq1B2I
	 uhY4vAHNp0YI10dWDi1eX6PdT2RcHpG7xoFcEn8IktqIO6XZPRirxYVSKk6pbQKb/P
	 DSv4qJNVwfWtA==
Date: Mon, 23 Oct 2023 07:53:57 +0000
To: Albert Esteve <aesteve@redhat.com>
From: Simon Ser <contact@emersion.fr>
Cc: qemu-devel@nongnu.org, zackr@vmware.com, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, iforbes@vmware.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chia-I Wu <olvaffe@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>, Matt Roper <matthew.d.roper@intel.com>, David Airlie <airlied@gmail.com>, banackm@vmware.com, Rob Clark <robdclark@gmail.com>, javierm@redhat.com, krastevm@vmware.com, spice-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>, Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, mombasawalam@vmware.com, Daniel Vetter <daniel@ffwll.ch>, ppaalanen@gmail.com, VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>, stable@vger.kernel.org, David Airlie <airlied@linux.ie>, Pekka Paalanen
	<pekka.paalanen@collabora.com>
Subject: Re: [PATCH v6 1/9] drm: Disable the cursor plane on atomic contexts with virtualized drivers
Message-ID: <JK64byEJdVeFlotnfIzSsyiHWQCs-Luun_S8XqvJ4jG1In3fsBD6FBYZHcmKEvwDOas123VjhJoONJLALDRa5TCdA8avSMEN0xXA6oE8sVU=@emersion.fr>
In-Reply-To: <20231023074613.41327-2-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com> <20231023074613.41327-2-aesteve@redhat.com>
Feedback-ID: 1358184:user:proton
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Acked-by: Simon Ser <contact@emersion.fr>
