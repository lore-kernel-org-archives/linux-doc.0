Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5E41D5CF2
	for <linux-doc@vger.kernel.org>; Tue, 26 Nov 2024 16:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638725; cv=none; b=RToEQAFE/OceJWdX1/vf2eqf+jGRSYoLsIXdNHKUQqJbTyhaZzPxhcu44icg0CDmFgth4+ZZG5QwmDF9aNHXU/PH2+8HU8vLvLCgZM0wP3Q/6389nMhctdc9hKj4FE6li3lJOxdrTK2qpajB8XZ6iXrr2UcOTrS4oEQIKrUVIT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638725; c=relaxed/simple;
	bh=PrNp76wW8HMdwH0cwCP+PHr9l8/sVTx4zF/LTTvbmUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGvzD2AygnNTR87fcYbiLyaO4uEYp4QlU/xf4qfHibLpizNXJzznsqQdgv08VFmceqzl7vi9qGxmqAanEp2HBl8dNB8is0LoH78IngkAzkic6Qi2jUknwO7G4B8NCPA90kXA024yMwcUlk7CEZfiK2WbV2mW4DDxKwbHrPOFZ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=LQjP8ytJ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="LQjP8ytJ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de79c2be4so2051293e87.2
        for <linux-doc@vger.kernel.org>; Tue, 26 Nov 2024 08:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1732638721; x=1733243521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcAfZ/tKcd525WHKqiM6C8xW9bMVu4dmgphDhQobdbA=;
        b=LQjP8ytJp1Cmsopulk7X28VBTqMRbZaN16Y5VtlI/L0ONC3xww3y0gPdkFMLVqEd5l
         FQQuRdoFPwa3UZYYDUG3vCuvA0qfTxVFzpEC7DAlqYN2NEovHQydJ0W3u94pAWwLoLqF
         I8/PZ/PpTdZI7RbHb7JZj+mHMDAT098OU0yLinOmo4WaEgMdzsreCT/okH28eBRLMcOd
         1E6jr/MEdBvUomYbsYx+LtBGBrfY5/G25opEkUgOohDs7QEBg1FdcarYjR+h3T2NleIw
         /45Vas219zA2yHg1roIZj+s5tH91ePanti6UwDQpkCCX9wtcM4Wh5PjHDjgP5qwMhJL4
         xyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638721; x=1733243521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QcAfZ/tKcd525WHKqiM6C8xW9bMVu4dmgphDhQobdbA=;
        b=fz74UZUVqwPfHQlBq0JBdzLUWWBVkhXybF3CPxhgM7f0+kfIfyKYiiPCA9jgS/pyUZ
         PPnXTq1xlCoE7yJcbvF1YvxTdXHYgYWsvRowmNSHYDfgdKmZ4FpF4ISoiYVh2SCJXmet
         67xEyl5DAJY0ctvesKURMEFEbTBrHkStIM4Bgr7g9HXnPzr+NlbOLfskaHYwmKwZ9kgZ
         d9/78nOvYUjkz2ojVUz2FBb5REtCexN6j5YmaxEWos/2QUXGXk6OPEqgvg7YPcBAElGe
         iISyQ5EozG/g1E/76/NUhu1qxoSw3PWsDEGDnu9wYd0NIRMz/vMWaMsepmfY7UNVJgfe
         4OIw==
X-Forwarded-Encrypted: i=1; AJvYcCXpHW0W6OivSSeTT52mpOg6+LTnYI/tr/2RH+UKifnEVJt/dFpkFB20Fwf3OjGNJxEzADSw3IydN3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+RYAE9qQZeLiJrQKJyys/2hM2cjY3RuajLJDafv2XrMSaDa8G
	cYJJjr8KpXW1mUuZoGpg//0/x5TLiEntfEvS+239/1lr4+g/7uWtbtheJzpYoLU=
X-Gm-Gg: ASbGnctbMwt8uBgQARW/uwxsIdUrqXiAoMFkKZ9xMG0hIcr5D8beeOkmbRhCUufoCJf
	WD0vccx+Q7MW4crDBtGApyP4RF92u0fSeapJy8bTtRrecLlZEQ/zKkp0BTV0TWh5VvHYSFnDbSa
	U6wgdqreDHkWJDvBgXg4nE5U+2hVYHD7W7It1Apn0iS8fTp4bmHQXxOJ7phcyQE4pqKJ8hfDKV9
	rwEFj6TG+Lbdjrgc0Sk20v3KEsLLaoP9o9h386RUPQK2eDJhCRQm8mlCS53YBrwCw==
X-Google-Smtp-Source: AGHT+IHKO8ti+rz+kvxis090tT7KPzGdlvrJ57ALl4kHSoxZZCrQaPQqNO7/LylzDOre3sTlVrGIoQ==
X-Received: by 2002:a05:6512:3f1f:b0:53d:e5f0:32de with SMTP id 2adb3069b0e04-53de5f0356cmr5115092e87.51.1732638721084;
        Tue, 26 Nov 2024 08:32:01 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e117bf5sm89514735e9.18.2024.11.26.08.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 08:32:00 -0800 (PST)
Message-ID: <2ffb2f37-f9b4-41b5-8de6-8fe0aac7e329@ursulin.net>
Date: Tue, 26 Nov 2024 16:31:59 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Extend and update documentation
To: Philipp Stanner <pstanner@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
References: <20241115103548.90605-2-pstanner@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241115103548.90605-2-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 15/11/2024 10:35, Philipp Stanner wrote:
> The various objects defined and used by the GPU scheduler are currently
> not fully documented. Furthermore, there is no documentation yet
> informing drivers about how they should handle timeouts.
> 
> Add documentation describing the scheduler's objects and timeout
> procedure. Consistently, update drm_sched_backend_ops.timedout_job()'s
> documentation.
> 
> Co-developed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> I shamelessly stole- ahm, borrowed this documentation patch that
> Christian had submitted a year ago:
> 
> https://lore.kernel.org/dri-devel/20231116141547.206695-1-christian.koenig@amd.com/
> 
> I took feedback from last year into account where applicable, but it's
> probably a good idea if you all take a close look again.
> 
> P.
> ---
>   Documentation/gpu/drm-mm.rst           |  36 +++++
>   drivers/gpu/drm/scheduler/sched_main.c | 200 ++++++++++++++++++++++---
>   include/drm/gpu_scheduler.h            |  16 +-
>   3 files changed, 225 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index d55751cad67c..95ee95fd987a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -556,12 +556,48 @@ Overview
>   .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>      :doc: Overview
>   
> +Job Object
> +----------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Job Object
> +
> +Entity Object
> +-------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Entity Object
> +
> +Hardware Fence Object
> +---------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Hardware Fence Object
> +
> +Scheduler Fence Object
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Scheduler Fence Object
> +
> +Scheduler and Run Queue Objects
> +-------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Scheduler and Run Queue Objects
> +
>   Flow Control
>   ------------
>   
>   .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>      :doc: Flow Control
>   
> +Error and Timeout handling
> +--------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Error and Timeout handling
> +
>   Scheduler Function References
>   -----------------------------
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e97c6c60bc96..76eb46281985 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,28 +24,155 @@
>   /**
>    * DOC: Overview
>    *
> - * The GPU scheduler provides entities which allow userspace to push jobs
> - * into software queues which are then scheduled on a hardware run queue.
> - * The software queues have a priority among them. The scheduler selects the entities
> - * from the run queue using a FIFO. The scheduler provides dependency handling
> - * features among jobs. The driver is supposed to provide callback functions for
> - * backend operations to the scheduler like submitting a job to hardware run queue,
> - * returning the dependencies of a job etc.
> + * The GPU scheduler is shared infrastructure intended to help drivers managing
> + * command submission to their hardware.
>    *
> - * The organisation of the scheduler is the following:
> + * To do so, it offers a set of scheduling facilities that interact with the
> + * driver through callbacks which the latter can register.
>    *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities
> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be scheduled on
> - *    the hardware.
> + * In particular, the scheduler takes care of:
> + *   - Ordering command submissions
> + *   - Signalling DMA fences, e.g., for finished commands
> + *   - Taking dependencies between command submissions into account
> + *   - Handling timeouts for command submissions
>    *
> - * The jobs in a entity are always scheduled in the order that they were pushed.
> + * All callbacks the driver needs to implement are restricted by DMA-fence
> + * signaling rules to guarantee deadlock free forward progress. This especially
> + * means that for normal operation no memory can be allocated in a callback.
> + * All memory which is needed for pushing the job to the hardware must be
> + * allocated before arming a job. It also means that no locks can be taken
> + * under which memory might be allocated as well.
>    *
> - * Note that once a job was taken from the entities queue and pushed to the
> - * hardware, i.e. the pending queue, the entity must not be referenced anymore
> - * through the jobs entity pointer.
> + * Memory which is optional to allocate, for example for device core dumping or
> + * debugging, *must* be allocated with GFP_NOWAIT and appropriate error
> + * handling if that allocation fails. GFP_ATOMIC should only be used if
> + * absolutely necessary since dipping into the special atomic reserves is
> + * usually not justified for a GPU driver.
> + *
> + * Note especially the following about the scheduler's historic background that
> + * lead to sort of a double role it plays today:
> + *
> + * In classic setups N entities share one scheduler, and the scheduler decides
> + * which job to pick from which entity and move it to the hardware ring next
> + * (that is: "scheduling").
> + *
> + * Many (especially newer) GPUs, however, can have an almost arbitrary number
> + * of hardware rings and it's a firmware scheduler which actually decides which
> + * job will run next. In such setups, the GPU scheduler is still used (e.g., in
> + * Nouveau) but does not "schedule" jobs in the classical sense anymore. It
> + * merely serves to queue and dequeue jobs and resolve dependencies. In such a
> + * scenario, it is recommended to have one scheduler per entity.
> + */
> +
> +/**
> + * DOC: Job Object
> + *
> + * The base job object (drm_sched_job) contains submission dependencies in the
> + * form of DMA-fence objects. Drivers can also implement an optional
> + * prepare_job callback which returns additional dependencies as DMA-fence
> + * objects. It's important to note that this callback can't allocate memory or
> + * grab locks under which memory is allocated.

AFAICT amdgpu_prepare_job can allocate memory. Maybe that is okay 
because scheduler workqueue is nowadays marked as WQ_MEM_RECLAIM but in 
general it would be more logical if it wasn't allocating. It does not 
seem an easy job to make it stop doing so. Perhaps Christian has 
something planned here?

> + *
> + * Drivers should use this as base class for an object which contains the
> + * necessary state to push the command submission to the hardware.
> + *
> + * The lifetime of the job object needs to last at least from submitting it to
> + * the scheduler (through drm_sched_job_arm()) until the scheduler has invoked
> + * drm_sched_backend_ops.free_job() and, thereby, has indicated that it does
> + * not need the job anymore. Drivers can of course keep their job object alive
> + * for longer than that, but that's outside of the scope of the scheduler
> + * component.
> + *
> + * Job initialization is split into two stages:
> + *   1. drm_sched_job_init() which serves for basic preparation of a job.
> + *      Drivers don't have to be mindful of this function's consequences and
> + *      its effects can be reverted through drm_sched_job_cleanup().
> + *   2. drm_sched_job_arm() which irrevokably arms a job for execution. This

irrevocably

(Btw I did not do a full read, just came here for prepare_job 
clarifications.)

Regards,

Tvrtko

> + *      activates the job's fence, i.e., it registers the callbacks. Thus,
> + *      inevitably, the callbacks will access the job and its memory at some
> + *      point in the future. This means that once drm_sched_job_arm() has been
> + *      called, the job structure has to be valid until the scheduler invoked
> + *      drm_sched_backend_ops.free_job().
> + *
> + * It's important to note that after arming a job drivers must follow the
> + * DMA-fence rules and can't easily allocate memory or takes locks under which
> + * memory is allocated.
> + */
> +
> +/**
> + * DOC: Entity Object
> + *
> + * The entity object (drm_sched_entity) which is a container for jobs which
> + * should execute sequentially. Drivers should create an entity for each
> + * individual context they maintain for command submissions which can run in
> + * parallel.
> + *
> + * The lifetime of the entity *should not* exceed the lifetime of the
> + * userspace process it was created for and drivers should call the
> + * drm_sched_entity_flush() function from their file_operations.flush()
> + * callback. It is possible that an entity object is not alive anymore
> + * while jobs previously fetched from it are still running on the hardware.
> + *
> + * This is done because all results of a command submission should become
> + * visible externally even after a process exits. This is normal POSIX
> + * behavior for I/O operations.
> + *
> + * The problem with this approach is that GPU submissions contain executable
> + * shaders enabling processes to evade their termination by offloading work to
> + * the GPU. So when a process is terminated with a SIGKILL the entity object
> + * makes sure that jobs are freed without running them while still maintaining
> + * correct sequential order for signaling fences.
> + */
> +
> +/**
> + * DOC: Hardware Fence Object
> + *
> + * The hardware fence object is a DMA-fence provided by the driver as result of
> + * running jobs. Drivers need to make sure that the normal DMA-fence semantics
> + * are followed for this object. It's important to note that the memory for
> + * this object can *not* be allocated in drm_sched_backend_ops.run_job() since
> + * that would violate the requirements for the DMA-fence implementation. The
> + * scheduler maintains a timeout handler which triggers if this fence doesn't
> + * signal within a configurable amount of time.
> + *
> + * The lifetime of this object follows DMA-fence refcounting rules. The
> + * scheduler takes ownership of the reference returned by the driver and
> + * drops it when it's not needed any more.
> + */
> +
> +/**
> + * DOC: Scheduler Fence Object
> + *
> + * The scheduler fence object (drm_sched_fence) which encapsulates the whole
> + * time from pushing the job into the scheduler until the hardware has finished
> + * processing it. This is internally managed by the scheduler, but drivers can
> + * grab additional reference to it after arming a job. The implementation
> + * provides DMA-fence interfaces for signaling both scheduling of a command
> + * submission as well as finishing of processing.
> + *
> + * The lifetime of this object also follows normal DMA-fence refcounting rules.
> + * The finished fence is the one normally exposed to the outside world, but the
> + * driver can grab references to both the scheduled as well as the finished
> + * fence when needed for pipelining optimizations.
> + */
> +
> +/**
> + * DOC: Scheduler and Run Queue Objects
> + *
> + * The scheduler object itself (drm_gpu_scheduler) does the actual work of
> + * selecting a job and pushing it to the hardware. Both FIFO and RR selection
> + * algorithm are supported, but FIFO is preferred for many use cases.
> + *
> + * The lifetime of the scheduler is managed by the driver using it. Before
> + * destroying the scheduler the driver must ensure that all hardware processing
> + * involving this scheduler object has finished by calling for example
> + * disable_irq(). It is *not* sufficient to wait for the hardware fence here
> + * since this doesn't guarantee that all callback processing has finished.
> + *
> + * The run queue object (drm_sched_rq) is a container for entities of a certain
> + * priority level. This object is internally managed by the scheduler and
> + * drivers shouldn't touch it directly. The lifetime of a run queue is bound to
> + * the scheduler's lifetime.
>    */
>   
>   /**
> @@ -72,6 +199,43 @@
>    * limit.
>    */
>   
> +/**
> + * DOC: Error and Timeout handling
> + *
> + * Errors schould be signaled by using dma_fence_set_error() on the hardware
> + * fence object before signaling it. Errors are then bubbled up from the
> + * hardware fence to the scheduler fence.
> + *
> + * The entity allows querying errors on the last run submission using the
> + * drm_sched_entity_error() function which can be used to cancel queued
> + * submissions in drm_sched_backend_ops.run_job()  as well as preventing
> + * pushing further ones into the entity in the driver's submission function.
> + *
> + * When the hardware fence doesn't signal within a configurable amount of time
> + * drm_sched_backend_ops.timedout_job() gets invoked. The driver should then
> + * follow the procedure described in that callback's documentation.
> + * (TODO: The timeout handler should probably switch to using the hardware
> + * fence as parameter instead of the job. Otherwise the handling will always
> + * race between timing out and signaling the fence).
> + *
> + * The scheduler also used to provided functionality for re-submitting jobs
> + * and, thereby, replaced the hardware fence during reset handling. This
> + * functionality is now marked as deprecated. This has proven to be
> + * fundamentally racy and not compatible with DMA-fence rules and shouldn't be
> + * used in new code.
> + *
> + * Additionally, there is the function drm_sched_increase_karma() which tries
> + * to find the entity which submitted a job and increases its 'karma' atomic
> + * variable to prevent resubmitting jobs from this entity. This has quite some
> + * overhead and resubmitting jobs is now marked as deprecated. Thus, using this
> + * function is discouraged.
> + *
> + * Drivers can still recreate the GPU state in case it should be lost during
> + * timeout handling *if* they can guarantee that forward progress will be made
> + * and this doesn't cause another timeout. But this is strongly hardware
> + * specific and out of the scope of the general GPU scheduler.
> + */
> +
>   #include <linux/wait.h>
>   #include <linux/sched.h>
>   #include <linux/completion.h>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9c437a057e5d..c52363453861 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -417,8 +417,8 @@ struct drm_sched_backend_ops {
>   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>   
>   	/**
> -	 * @timedout_job: Called when a job has taken too long to execute,
> -	 * to trigger GPU recovery.
> +	 * @timedout_job: Called when a hardware fence didn't signal within a
> +	 * configurable amount of time. Triggers GPU recovery.
>   	 *
>   	 * This method is called in a workqueue context.
>   	 *
> @@ -429,9 +429,8 @@ struct drm_sched_backend_ops {
>   	 *    scheduler thread and cancel the timeout work, guaranteeing that
>   	 *    nothing is queued while we reset the hardware queue
>   	 * 2. Try to gracefully stop non-faulty jobs (optional)
> -	 * 3. Issue a GPU reset (driver-specific)
> -	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> -	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
> +	 * 3. Issue a GPU or context reset (driver-specific)
> +	 * 4. Restart the scheduler using drm_sched_start(). At that point, new
>   	 *    jobs can be queued, and the scheduler thread is unblocked
>   	 *
>   	 * Note that some GPUs have distinct hardware queues but need to reset
> @@ -447,16 +446,15 @@ struct drm_sched_backend_ops {
>   	 * 2. Try to gracefully stop non-faulty jobs on all queues impacted by
>   	 *    the reset (optional)
>   	 * 3. Issue a GPU reset on all faulty queues (driver-specific)
> -	 * 4. Re-submit jobs on all schedulers impacted by the reset using
> -	 *    drm_sched_resubmit_jobs()
> -	 * 5. Restart all schedulers that were stopped in step #1 using
> +	 * 4. Restart all schedulers that were stopped in step #1 using
>   	 *    drm_sched_start()
>   	 *
>   	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
>   	 * and the underlying driver has started or completed recovery.
>   	 *
>   	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
> -	 * available, i.e. has been unplugged.
> +	 * available, for example if it has been unplugged or failed to
> +	 * recover.
>   	 */
>   	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
>   
