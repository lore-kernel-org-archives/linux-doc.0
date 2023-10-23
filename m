Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92EC23BE
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 07:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="e+UKbEOH"
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84EEDB
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 00:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1698047737; x=1698306937;
	bh=/hf6kNPKPV2koPQDhQqJVQiBA3snlHoEuKHASPZI8vc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=e+UKbEOHMcblXJPOvvUgblX7xWJJTswc8PfoFfkJwWVnQNcbbwbXuaKKVp2+O7Zkf
	 GJXAxyOZVkRWU+0UR5cyeZG3Iio8hlqsri8RsvzXMCSEuKHUcT76Ca0uNN+sNu/gLn
	 v/M3uR7RSVEvEf3Ystw3/0NpAkRFwHzj8iNBoVzPfoKzuQx2zd6QJxHM6yMx4tVev0
	 fm9g6ZLzmw/sKQhA+DC3FYfJfVd1IB/Ansj6erAAgOQS4285tY2d6SkDe7i75IL2zr
	 dvjyJKkuHJhvLWzgMakGcMsBr4C2PCeA6S1n6zLX53Hudj6RTNaUe0VqDP2u/G+iZS
	 N283kubt7sIkA==
Date: Mon, 23 Oct 2023 07:55:31 +0000
To: Albert Esteve <aesteve@redhat.com>
From: Simon Ser <contact@emersion.fr>
Cc: qemu-devel@nongnu.org, zackr@vmware.com, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, iforbes@vmware.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chia-I Wu <olvaffe@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>, Matt Roper <matthew.d.roper@intel.com>, David Airlie <airlied@gmail.com>, banackm@vmware.com, Rob Clark <robdclark@gmail.com>, javierm@redhat.com, krastevm@vmware.com, spice-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>, Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, mombasawalam@vmware.com, Daniel Vetter <daniel@ffwll.ch>, ppaalanen@gmail.com, VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v6 0/9] Fix cursor planes with virtualized drivers
Message-ID: <-ngmaSLF2S5emYjTBWcLRNzvJRoe_eZ-Nv9HQhE6ZLuK8nIE2ZbfVh2G2O2Z41GoIFIRpts0ukEtFXUx8pNAptmrZBhlXxaQGykx_qCZ_9k=@emersion.fr>
In-Reply-To: <20231023074613.41327-1-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
Feedback-ID: 1358184:user:proton
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, October 23rd, 2023 at 09:46, Albert Esteve <aesteve@redhat.com> =
wrote:

> Link to the IGT test covering this patch (already merged):
> https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html

Hmm. IGT should not be merged before the kernel, because as long as the
kernel is not merged there might be some uAPI changes.

> Mutter patch:
> https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html

Seems like this link is same as IGT? Copy-pasta fail maybe?
