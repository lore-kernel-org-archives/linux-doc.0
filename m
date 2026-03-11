Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21851372EC6;
	Wed, 11 Mar 2026 06:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211473; cv=none; b=Ytlbwj/L8O/4o87V9GHO3bhVDxFFcbbr1ywMy7jYjsLPz6XlI41ucjF91wNPLiikUuhEuEDFkXu5Ue9aM3KRPNbM+7bQVpOxOVcIsqQzX4fj/sa9SlKaCgDIf+i8O6aTENhoG6c17ylegwMUXyx6c5AO86VL/cVJPfTMkd1a7lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211473; c=relaxed/simple;
	bh=eAZAXU6Km1D23JwApA7xWMDcedyoC3ptPwEfq9gHGDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXTpKzzrNf+3NaLNAyCMR8Bnj2y93Sa6FhG2sHaPHx6OaS15YkxPEneXaOXmGhr1bQXCUxVHri5iuqMZw0UUbK9nwc7Rwn4R1MGXOcLj7C1p/Usr/RePQrmeD4LPTJg6g66byMt9ADmG/qZYUc7cY179btFydeGCzMP3uAAJ17E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rsIygH0o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rsIygH0o"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70DEB4B3;
	Wed, 11 Mar 2026 07:43:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773211401;
	bh=eAZAXU6Km1D23JwApA7xWMDcedyoC3ptPwEfq9gHGDQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rsIygH0oWjm/yn1HLtqfPrXEeTxvXY6CdDYgSsI8/xF05rmozqgz0W1N1H9XvnYem
	 qcy1d4J4dMezdOPzQRMmaX645006pTZ0qZV3jKDoqioyYTU9gA6ZYDw7jIMDDxqQ5J
	 B3u7Ce8fGiRNEc8OF6S+r/MBw0EwxwOia6JeOuQQ=
Message-ID: <b0d9aee3-46c1-486d-9516-43ee23658f40@ideasonboard.com>
Date: Wed, 11 Mar 2026 08:44:24 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] drm/atomic: Document atomic state lifetime
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-1-de7397c8e1cf@kernel.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20260310-drm-mode-config-init-v1-1-de7397c8e1cf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/03/2026 18:06, Maxime Ripard wrote:
> How drm_atomic_state structures and the various entity structures are
> allocated and freed isn't really trivial, so let's document it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/drm-kms.rst |  6 +++++
>  drivers/gpu/drm/drm_atomic.c  | 52 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 2292e65f044c3bdebafbb8f83dfe7ac12e831273..017c7b196ed7ead4cf5fa8572e1f977d9e00dda8 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -280,10 +280,16 @@ structure, ordering of committing state changes to hardware is sequenced using
>  :c:type:`struct drm_crtc_commit <drm_crtc_commit>`.
>  
>  Read on in this chapter, and also in :ref:`drm_atomic_helper` for more detailed
>  coverage of specific topics.
>  
> +Atomic State Lifetime
> +---------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_atomic.c
> +   :doc: state lifetime
> +
>  Handling Driver Private State
>  -----------------------------
>  
>  .. kernel-doc:: drivers/gpu/drm/drm_atomic.c
>     :doc: handling driver private state
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 4283ab4d06c581727cc98b1dc870bf69691ea654..92c6afc8f22c8307a59dc266aacdb8e03351409d 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -45,10 +45,62 @@
>  #include <drm/drm_colorop.h>
>  
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
>  
> +/**
> + * DOC: state lifetime
> + *
> + * &struct drm_atomic_state represents an update to video pipeline
> + * state. Despite its confusing name, it's actually a transient object
> + * that holds a state update as a collection of pointer to individual
> + * objects states. &struct drm_atomic_state has a much shorter lifetime

Hmm, I think "a collection of pointers to individual object states". Hmm
or "objects' states"? I like the former.

> + * than the objects states, since it's only allocated while preparing,

"objects' states" or "object states".

> + * checking or doing the update, while object states are allocated while
> + * the state will be, or is active in the hardware.
> + *
> + * Their respective lifetimes are:
> + *
> + * - at reset time, the object reset implementation will allocate a new,
> + *   default, state and will store it in the object state pointer.

"object's". This is the "active state", is it?

> + *
> + * - whenever a new update is needed:
> + *
> + *   + we allocate a new &struct drm_atomic_state using drm_atomic_state_alloc().
> + *
> + *   + we copy the state of each affected entity into our &struct
> + *     drm_atomic_state using drm_atomic_get_plane_state(),
> + *     drm_atomic_get_crtc_state(), drm_atomic_get_connector_state(), or
> + *     drm_atomic_get_private_obj_state(). That state can then be
> + *     modified.

Maybe clarify what is the state returned by these. It's the "active
state", isn't it, drm_crtc.state or similar?

> + *
> + *     At that point, &struct drm_atomic_state stores three state
> + *     pointers for that particular entity: the old, new, and existing
> + *     (called "state") states. The old state is the state currently
> + *     active in the hardware, which is either the one initialized by
> + *     reset() or a newer one if a commit has been made. The new state
> + *     is the state we just allocated and we might eventually commit to
> + *     the hardware. The existing state points to the state we'll
> + *     eventually have to free when the drm_atomic_state will be
> + *     destroyed, but points to the new state for now.

From this, I don't understand the difference between the old state and
the existing state. And if the existing state is the one we'll free,
isn't that the old state, not new state? Oh, is the existing state a
state we have to free when the drm_atomic_state would is freed? And at
this point the new state is the one, as it's not committed?

> + *
> + *   + After the state is populated, it is checked. If the check is
> + *     successful, the update is committed. Part of the commit is a call
> + *     to drm_atomic_helper_swap_state() which will turn the new states
> + *     into the active states. Doing so involves updating the objects

"object's"

> + *     state pointer (&drm_crtc.state or similar) to point to the new
> + *     state, and the existing states will now point to the old states,
> + *     that used to be active but isn't anymore.

"aren't"

I think I understand this, but... It kind of brings in a new state
concept, "active state".

> + *
> + *   + When the commit is done, and when all references to our &struct
> + *     drm_atomic_state are put, drm_atomic_state_clear() runs and will
> + *     free all the old states.
> + *
> + *   + Now, we don't have any active &struct drm_atomic_state anymore,
> + *     and only the entity active states remain allocated.
> + */
> +
Even if this is a bit hard to read, I think it really clarifies the
state lifetime.

 Tomi

