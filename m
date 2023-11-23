Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="cKWk6SyY"
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64EF51B6
	for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 14:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1700777494; x=1701036694;
	bh=1FSAtIYmUftMaxOldMoteCptRTxIkeeuJnWLHgIXrlA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cKWk6SyY7AK0lUuCp5Xn1fwoCcUc2EdFsBbzXNqYMgHpOlmoEFhqIx7LNPXCVydfZ
	 hp8uUX5zJnqE9v/ix0YVj0RqzUUCHMvjOCeH2Xwd2xHH0McUo9+3qYY54YBj84GacZ
	 pWI5jsjKxxLgTTePqS7y3u9F9k8ieFvYSl6Q6iK44gNmnWkWXB9Sy3Crf/06IaxflB
	 N+kSQL2L8hcB8CWR5XWZrqB6Bu0trOXoYPLKmAlRKP1X1oQuAlUPc6Uvripwnl25Fb
	 MZGqoGbgOMKE23vmgO0yvUp/CeMO2Lo1MNJHA1ZzK19jncMnk7Wwh95LC069Y4Wno8
	 XFTP4BYoDTbUg==
Date: Thu, 23 Nov 2023 22:11:14 +0000
To: Javier Martinez Canillas <javierm@redhat.com>
From: Simon Ser <contact@emersion.fr>
Cc: Albert Esteve <aesteve@redhat.com>, qemu-devel@nongnu.org, zackr@vmware.com, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, iforbes@vmware.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chia-I Wu <olvaffe@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>, Matt Roper <matthew.d.roper@intel.com>, David Airlie <airlied@gmail.com>, banackm@vmware.com, Rob Clark <robdclark@gmail.com>, krastevm@vmware.com, spice-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>, Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, mombasawalam@vmware.com, Daniel Vetter <daniel@ffwll.ch>, ppaalanen@gmail.com, VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v6 0/9] Fix cursor planes with virtualized drivers
Message-ID: <xUgaKXv4lqgCEWWlB4KRGx-yLXefTg-uXEdXaTqAhOTxC4G7bCILTK9SH6ymdmMMBLooAl3_Kdvl5JXeUA8Hofg9PcCMBhPWhVhnCoxvgqA=@emersion.fr>
In-Reply-To: <87y1eqc5qk.fsf@minerva.mail-host-address-is-not-set>
References: <20231023074613.41327-1-aesteve@redhat.com> <-ngmaSLF2S5emYjTBWcLRNzvJRoe_eZ-Nv9HQhE6ZLuK8nIE2ZbfVh2G2O2Z41GoIFIRpts0ukEtFXUx8pNAptmrZBhlXxaQGykx_qCZ_9k=@emersion.fr> <CADSE00KW4+hpbAbZAusBngq5FYSa067wYJCGeetqngWRJaD9Kg@mail.gmail.com> <87y1eqc5qk.fsf@minerva.mail-host-address-is-not-set>
Feedback-ID: 1358184:user:proton
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, November 22nd, 2023 at 13:49, Javier Martinez Canillas <javie=
rm@redhat.com> wrote:

> Any objections to merge the series ?

No objections from me :)
